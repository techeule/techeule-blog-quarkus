package com.techeule.blogq.infra.stacks.frontend;

import lombok.Getter;
import software.amazon.awscdk.CfnOutput;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.services.certificatemanager.Certificate;
import software.amazon.awscdk.services.certificatemanager.CertificateValidation;
import software.amazon.awscdk.services.route53.HostedZone;
import software.amazon.awscdk.services.route53.HostedZoneProviderProps;
import software.amazon.awscdk.services.route53.IHostedZone;
import software.constructs.Construct;

public class ApplicationFrontendCertificateStack extends Stack {
  static final String APP_NAME = "blogq-ui-webapp-certificate";
  private final String uiWebAppFqdn;
  private final String rootDomainName;

  @Getter
  private Certificate uiWebAppCertificate;

  public ApplicationFrontendCertificateStack(final Construct scope,
                                             final String id,
                                             final StackProps props,
                                             final String uiWebAppSubDomain,
                                             final String rootDomainName) {
    super(scope, id, props);
    this.rootDomainName = rootDomainName;
    uiWebAppFqdn = uiWebAppSubDomain + '.' + rootDomainName;
    setup();
  }

  private void setup() {
    prepareDnsZoneAndCertificates();
  }

  private void prepareDnsZoneAndCertificates() {
    final IHostedZone hostedZone = HostedZone.fromLookup(this,
                                                         "dns-domain",
                                                         HostedZoneProviderProps.builder()
                                                                                .domainName(rootDomainName)
                                                                                .privateZone(false)
                                                                                .build());

    uiWebAppCertificate = Certificate.Builder.create(this, APP_NAME + "-certificate")
                                             .validation(CertificateValidation.fromDns(hostedZone))
                                             .domainName(uiWebAppFqdn)
                                             .build();

    CfnOutput.Builder
      .create(this, "blogq-ui-webapp-certificate-cert-output")
      .exportName("blogq-ui-webapp-certificate-cert-output")
      .value(uiWebAppCertificate.getCertificateArn())
      .description(APP_NAME + " Certificate for CloudFront")
      .build();
  }
}
