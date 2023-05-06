package com.techeule.blogq.infra.stacks.frontend;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.jetbrains.annotations.NotNull;

import com.techeule.blogq.infra.resources.FrontendUiStorage;
import lombok.Getter;
import software.amazon.awscdk.CfnOutput;
import software.amazon.awscdk.Duration;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.services.certificatemanager.Certificate;
import software.amazon.awscdk.services.certificatemanager.ICertificate;
import software.amazon.awscdk.services.cloudfront.Behavior;
import software.amazon.awscdk.services.cloudfront.CfnDistribution;
import software.amazon.awscdk.services.cloudfront.CfnOriginAccessControl;
import software.amazon.awscdk.services.cloudfront.CloudFrontAllowedMethods;
import software.amazon.awscdk.services.cloudfront.CloudFrontWebDistribution;
import software.amazon.awscdk.services.cloudfront.PriceClass;
import software.amazon.awscdk.services.cloudfront.S3OriginConfig;
import software.amazon.awscdk.services.cloudfront.SSLMethod;
import software.amazon.awscdk.services.cloudfront.SecurityPolicyProtocol;
import software.amazon.awscdk.services.cloudfront.SourceConfiguration;
import software.amazon.awscdk.services.cloudfront.ViewerCertificate;
import software.amazon.awscdk.services.cloudfront.ViewerCertificateOptions;
import software.amazon.awscdk.services.cloudfront.ViewerProtocolPolicy;
import software.amazon.awscdk.services.iam.Effect;
import software.amazon.awscdk.services.iam.PolicyStatement;
import software.amazon.awscdk.services.iam.PolicyStatementProps;
import software.amazon.awscdk.services.iam.ServicePrincipal;
import software.amazon.awscdk.services.route53.ARecord;
import software.amazon.awscdk.services.route53.HostedZone;
import software.amazon.awscdk.services.route53.HostedZoneProviderProps;
import software.amazon.awscdk.services.route53.IHostedZone;
import software.amazon.awscdk.services.route53.RecordTarget;
import software.amazon.awscdk.services.route53.targets.CloudFrontTarget;
import software.amazon.awscdk.services.s3.IBucket;
import software.constructs.Construct;
import software.constructs.IConstruct;

@Getter
public class ApplicationFrontendStack extends Stack {
  private static final String APP_NAME = "blogq-ui-webapp";
  private static final String INDEX_HTML = "/index.html";
  static final int ERROR_CACHING_MIN_TTL = 60 * 60;
  private final String uiWebAppFqdn;
  private final String rootDomainName;
  private final String uiWebAppSubDomain;
  private final String automatorUiCertificateArn;
  private final FrontendUiStorage.Props uiStorageProps;
  private IHostedZone hostedZone;
  private IBucket automatorUiBucket;
  private ICertificate uiWebAppCertificate;
  private CloudFrontWebDistribution cloudFrontWebDistribution;
  private ARecord aRecord;
  private FrontendUiStorage frontendUiStorage;

  public ApplicationFrontendStack(final Construct scope,
                                  final String id,
                                  final StackProps props,
                                  final String uiWebAppSubDomain,
                                  final String rootDomainName,
                                  final String automatorUiCertificateArn,
                                  final String bucketName,
                                  final Set<String> assets
  ) {
    super(scope, id, props);
    uiStorageProps = FrontendUiStorage.Props.builder()
      .bucketName(bucketName)
      .appName(APP_NAME)
      .assets(assets)
      .build();
    this.rootDomainName = rootDomainName;
    this.uiWebAppSubDomain = uiWebAppSubDomain;
    uiWebAppFqdn = uiWebAppSubDomain + '.' + rootDomainName;
    this.automatorUiCertificateArn = automatorUiCertificateArn;
    setup();
  }

  private void setup() {
    frontendUiStorage = new FrontendUiStorage(this, "storage", uiStorageProps);
    automatorUiBucket = frontendUiStorage.getBucket();
    prepareDnsZoneAndCertificates();
    setupCloudFront();
  }

  private void prepareDnsZoneAndCertificates() {
    hostedZone = HostedZone.fromLookup(this,
      "dns-domain",
      HostedZoneProviderProps.builder().domainName(rootDomainName).privateZone(false).build());

    uiWebAppCertificate = Certificate.fromCertificateArn(this, "certificate", automatorUiCertificateArn);
  }

  private void setupCloudFront() {
    final var viewerCertificateOptions = ViewerCertificateOptions.builder()
      .aliases(List.of(uiWebAppFqdn))
      .securityPolicy(SecurityPolicyProtocol.TLS_V1_2_2021)
      .sslMethod(SSLMethod.SNI)
      .build();

    final var viewerCertificate = ViewerCertificate.fromAcmCertificate(uiWebAppCertificate, viewerCertificateOptions);
    cloudFrontWebDistribution = CloudFrontWebDistribution.Builder.create(this, "cloudFront")
      .originConfigs(List.of(getS3OriginConfig()))
      .defaultRootObject("index.html")
      .viewerCertificate(viewerCertificate)
      .viewerProtocolPolicy(ViewerProtocolPolicy.REDIRECT_TO_HTTPS)
      .priceClass(PriceClass.PRICE_CLASS_ALL)
      .errorConfigurations(getCustomErrorResponseProperties())
      .build();

    final var policyStatementProps = PolicyStatementProps
      .builder()
      .sid("AllowCloudFrontServicePrincipalReadOnly to all Bucket Objects")
      .effect(Effect.ALLOW)
      .principals(List.of(new ServicePrincipal("cloudfront.amazonaws.com")))
      .actions(List.of("s3:GetObject"))
      .resources(List.of(automatorUiBucket.getBucketArn() + "/*"))
      .conditions(Map.of(
        "StringEquals",
        Map.of("AWS:SourceArn", "arn:aws:cloudfront::" + getAccount() + ":distribution/" + cloudFrontWebDistribution.getDistributionId())
      ))
      .build();
    final var policyStatement = new PolicyStatement(policyStatementProps);
    automatorUiBucket.addToResourcePolicy(policyStatement);

    aRecord = ARecord.Builder.create(this, "dns-record")
      .zone(hostedZone)
      .recordName(uiWebAppSubDomain)
      .ttl(Duration.minutes(1))
      .target(RecordTarget.fromAlias(new CloudFrontTarget(cloudFrontWebDistribution)))
      .build();

    CfnOutput.Builder.create(this, "dns-record-name")
      .exportName(APP_NAME + "-dns-record-name")
      .value(uiWebAppFqdn)
      .build();

    final var cfnOriginAccessControl = getCfnOriginAccessControl();

    final IConstruct defaultChild = cloudFrontWebDistribution.getNode().getDefaultChild();
    if (defaultChild instanceof CfnDistribution) {
      final var cfnDistribution = (CfnDistribution) defaultChild;
      cfnDistribution
        .addPropertyOverride("DistributionConfig.Origins.0.OriginAccessControlId", cfnOriginAccessControl.getAttrId());
    }

    CfnOutput.Builder.create(this, "cloudfront-distribution-id-output")
      .exportName("blogq-ui-webapp-cloudfront-distribution-id-output")
      .value(cloudFrontWebDistribution.getDistributionId())
      .build();
  }

  @NotNull
  private static List<CfnDistribution.CustomErrorResponseProperty> getCustomErrorResponseProperties() {
    return Set.of(400, 403, 404).stream()
      .sorted()
      .map(errorCode -> CfnDistribution.CustomErrorResponseProperty.builder()
        .errorCode(errorCode)
        .responseCode(200)
        .responsePagePath(INDEX_HTML)
        .errorCachingMinTtl(ERROR_CACHING_MIN_TTL)
        .build())
      .collect(Collectors.toList());
  }

  @NotNull
  private CfnOriginAccessControl getCfnOriginAccessControl() {
    final var originAccessControlConfig = CfnOriginAccessControl.OriginAccessControlConfigProperty
      .builder()
      .name(APP_NAME + "-OAC")
      .description("Allow CloudFront to access S3 Bucket")
      .originAccessControlOriginType("s3")
      .signingBehavior("always")
      .signingProtocol("sigv4")
      .build();
    return CfnOriginAccessControl.Builder.create(this, "cloudFront-OAC")
      .originAccessControlConfig(originAccessControlConfig)
      .build();
  }

  @NotNull
  private SourceConfiguration getS3OriginConfig() {
    final var s3OriginSource = S3OriginConfig.builder()
      .s3BucketSource(automatorUiBucket)
      .build();

    final var defaultBehavior = Behavior.builder()
      .isDefaultBehavior(true)
      .allowedMethods(CloudFrontAllowedMethods.GET_HEAD)
      .compress(true)
      .build();

    return SourceConfiguration.builder()
      .s3OriginSource(s3OriginSource)
      .behaviors(List.of(defaultBehavior))
      .build();
  }
}
