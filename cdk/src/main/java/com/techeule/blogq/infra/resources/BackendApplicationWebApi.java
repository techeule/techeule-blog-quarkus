package com.techeule.blogq.infra.resources;

import lombok.AllArgsConstructor;
import lombok.Getter;
import software.amazon.awscdk.CfnOutput;
import software.amazon.awscdk.Duration;
import software.amazon.awscdk.services.apigatewayv2.alpha.*;
import software.amazon.awscdk.services.apigatewayv2.authorizers.alpha.HttpJwtAuthorizer;
import software.amazon.awscdk.services.apigatewayv2.integrations.alpha.HttpLambdaIntegration;
import software.amazon.awscdk.services.certificatemanager.Certificate;
import software.amazon.awscdk.services.certificatemanager.CertificateValidation;
import software.amazon.awscdk.services.certificatemanager.ICertificate;
import software.amazon.awscdk.services.lambda.IFunction;
import software.amazon.awscdk.services.route53.*;
import software.amazon.awscdk.services.route53.targets.ApiGatewayv2DomainProperties;
import software.constructs.Construct;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class BackendApplicationWebApi extends Construct {
  private final Props props;
  private ICertificate webApiCertificate;
  private IHostedZone hostedZone;

  public BackendApplicationWebApi(final Construct scope,
                                  final String id,
                                  final Props props) {
    super(scope, id);
    this.props = props;
    prepareDnsZoneAndCertificates();
    integrateWithHttpApiGateway();
  }

  private void prepareDnsZoneAndCertificates() {
    hostedZone = HostedZone.fromLookup(this, "dns-domain",
      HostedZoneProviderProps
        .builder()
        .domainName(props.getRootDomainName())
        .privateZone(false)
        .build()
    );

    webApiCertificate = Certificate
      .Builder
      .create(this, "backend-webapi-certificate")
      .validation(CertificateValidation.fromDns(hostedZone))
      .domainName(props.getWebApiFqdn())
      .build();
  }

  private void integrateWithHttpApiGateway() {
    final var domainName = DomainName
      .Builder
      .create(this, "backend-domain-name")
      .domainName(props.getWebApiFqdn())
      .certificate(webApiCertificate)
      .endpointType(EndpointType.REGIONAL)
      .build();

    final CorsPreflightOptions corsPreflight = CorsPreflightOptions.builder()
      .allowHeaders(List.copyOf(props.getAllowHeaders()))
      .allowMethods(List.of(
        CorsHttpMethod.PUT,
        CorsHttpMethod.GET,
        CorsHttpMethod.POST,
        CorsHttpMethod.DELETE,
        CorsHttpMethod.HEAD,
        CorsHttpMethod.OPTIONS
      ))
      .allowOrigins(List.copyOf(props.getAllowedOrigins()))
      .exposeHeaders(List.of("Location"))
      .maxAge(Duration.minutes(1))
      .allowCredentials(true)
      .build();

    final var lambdaIntegration = new HttpLambdaIntegration("DefaultIntegration", props.getFunction());
    final var authorizer = HttpJwtAuthorizer.Builder
      .create("BlogQ-HTTP-JWT-Authorizer", props.getOidcIssuer().toString())
      .jwtAudience(new ArrayList<>(props.getJwtAudience()))
      .build();

    final var api = HttpApi.Builder
      .create(this, "HttpApi-BlogQ-Backend")
      .defaultIntegration(lambdaIntegration)
      .defaultAuthorizer(authorizer)
      .defaultDomainMapping(
        DomainMappingOptions.builder()
          .domainName(domainName)
          .build()
      )
      .corsPreflight(corsPreflight)
      .build();

    final var noneAuthorizer = new HttpNoneAuthorizer();

    api.addRoutes(AddRoutesOptions
      .builder()
      .methods(List.of(HttpMethod.OPTIONS))
      .path("/{proxy+}")
      .authorizer(noneAuthorizer)
      .integration(lambdaIntegration)
      .build());

    ARecord
      .Builder
      .create(this, "dns-entry-http-api-gw")
      .zone(hostedZone)
      .recordName(props.getWebApiSubdomain())
      .ttl(Duration.minutes(2))
      .target(
        RecordTarget.fromAlias(new ApiGatewayv2DomainProperties(domainName.getRegionalDomainName(), domainName.getRegionalHostedZoneId()))
      )
      .build();
    final var url = api.getUrl();
    CfnOutput.Builder.create(this, "WebApi-" + props.getWebApiSubdomain() + "-UrlOutput").value(url).build();
    CfnOutput.Builder.create(this, "Custom-Domain-UrlOutput").value("https://" + props.getWebApiFqdn() + "/resources").build();
  }

  @lombok.Builder
  @Getter
  @AllArgsConstructor
  public static class Props {
    private final IFunction function;
    private final String webApiFqdn;
    private final String rootDomainName;
    private final String webApiSubdomain;
    private final Set<String> allowHeaders;
    private final Set<String> allowedOrigins;
    private final URI oidcIssuer;
    private final Set<String> jwtAudience;
  }
}
