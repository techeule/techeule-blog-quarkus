package com.techeule.blogq.infra.stacks.backend;

import java.net.URI;
import java.util.Objects;
import java.util.Set;

import com.techeule.blogq.infra.resources.BackendApplicationLambda;
import com.techeule.blogq.infra.resources.BackendApplicationWebApi;
import com.techeule.blogq.infra.resources.BackendStorage;
import org.jetbrains.annotations.NotNull;

import lombok.Getter;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.services.lambda.Code;
import software.constructs.Construct;

@Getter
public class ApplicationBackendStack extends Stack {
  public static final String APP_NAME = "techeule-blogq";
  private static final int TIMEOUT_SECONDS = 600;
  private static final int MAX_MEMORY_MB = 4096;
  private final String webApiFqdn;
  private final BackendStorage backendStorage;
  private final Set<String> allowOrigins;
  private final int apiLambdaMemory;
  private final String deploymentEnvironment;
  private final URI oidcIssuer;
  private final Set<String> jwtAudience;
  private BackendApplicationLambda.Props lambdaProps;
  private BackendApplicationLambda backendApplicationLambda;
  private BackendApplicationWebApi.Props webApiProps;
  private BackendApplicationWebApi automatorWebApi;

  public ApplicationBackendStack(final Construct scope,
                                 final String id,
                                 final StackProps props,
                                 final String webApiSubDomain,
                                 final String rootDomainName,
                                 final Set<String> allowOrigins,
                                 final BackendStorage backendStorage,
                                 final int webApiLambdaMemory,
                                 final String deploymentEnvironment,
                                 final URI oidcIssuer,
                                 final Set<String> jwtAudience
  ) {
    super(scope, id, props);
    apiLambdaMemory = webApiLambdaMemory;
    this.deploymentEnvironment = deploymentEnvironment;
    this.oidcIssuer = oidcIssuer;
    this.jwtAudience = jwtAudience;
    webApiFqdn = webApiSubDomain + '.' + rootDomainName;
    this.backendStorage = backendStorage;
    this.allowOrigins = Objects.requireNonNullElse(allowOrigins, Set.of());
    defineStacks(webApiSubDomain, rootDomainName);
  }

  private void defineStacks(final String subdomain,
                            final String rootDomainName) {
    lambdaProps = BackendApplicationLambda.Props
      .builder()
      .code(Code.fromAsset("../blogq-backend/target/function.zip"))
      .timeoutSeconds(TIMEOUT_SECONDS)
      .functionName(APP_NAME)
      .memory(Math.min(apiLambdaMemory, MAX_MEMORY_MB))
      .withSnapStart(true)
      .table(backendStorage.getTable())
      .deploymentEnvironment(deploymentEnvironment)
      .build();
    backendApplicationLambda = new BackendApplicationLambda(this, "BlogQLambda", lambdaProps);

    webApiProps = BackendApplicationWebApi.Props
      .builder()
      .allowedOrigins(allowOrigins)
      .allowHeaders(getAllowHeaders())
      .webApiFqdn(webApiFqdn)
      .function(backendApplicationLambda.getFunction())
      .rootDomainName(rootDomainName)
      .webApiSubdomain(subdomain)
      .oidcIssuer(oidcIssuer)
      .jwtAudience(jwtAudience)
      .build();
    automatorWebApi = new BackendApplicationWebApi(this, "BlogQWeb", webApiProps);
  }

  @NotNull
  private static Set<String> getAllowHeaders() {
    return Set.of(
      "Content-Type",
      "Accept",
      "Authorization"
    );
  }
}
