package com.techeule.blogq.infra.resources;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import org.jetbrains.annotations.NotNull;
import software.amazon.awscdk.CfnOutput;
import software.amazon.awscdk.Duration;
import software.amazon.awscdk.services.dynamodb.ITable;
import software.amazon.awscdk.services.lambda.Runtime;
import software.amazon.awscdk.services.lambda.*;
import software.constructs.Construct;

import java.net.URI;
import java.time.Instant;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

public class BackendApplicationLambda extends Construct {

  private static final String QUARKUS_REQUEST_HANDLER = "io.quarkus.amazon.lambda.runtime.QuarkusStreamHandler::handleRequest";
  private final Props props;
  private final Map<String, String> configuration;
  @Getter
  private IFunction function;

  public BackendApplicationLambda(@NotNull final Construct scope,
                                  @NotNull final String id,
                                  final Props props) {
    super(scope, id);
    Objects.requireNonNull(props.getTable(), "datastore::Table must not be null");
    this.props = props;
    configuration = Map.of(
      "QUARKUS_PROFILE", "lambda",
      "T12S_OIDC_ROOT", props.getOidcIssuer().toString(),
      "MP_JWT_VERIFY_AUDIENCES", String.join(",", props.getJwtAudience()),
      "TZ", "Europe/Berlin",
      "JAVA_TOOL_OPTIONS", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1",
      "BLOGQ_STORAGE_DYNAMODB_TABLE_NAME", props.getTable().getTableName(),
      "T12S_APPLICATION_ENVIRONMENT", props.getDeploymentEnvironment(),
      "T12S_APPLICATION_RUNTIME", "aws-lambda"
    );

    setupLambda();
  }

  void setupLambda() {
    function = Function.Builder.create(this, props.getFunctionName())
      .runtime(Runtime.JAVA_17)
      .architecture(getArchitecture())
      .code(props.getCode())
      .handler(QUARKUS_REQUEST_HANDLER)
      .memorySize(props.getMemory())
      .functionName(props.getFunctionName())
      .environment(configuration)
      .timeout(Duration.seconds(props.getTimeoutSeconds()))
      .build();

    props.getTable().grantReadWriteData(function);

    if (props.isWithSnapStart()) {
      final var version = setupSnapStart();
      function = createAlias(version);
    }

    CfnOutput.Builder.create(this, props.getFunctionName() + "-out")
      .value(function.getFunctionArn())
      .build();
  }

  private Architecture getArchitecture() {
    if (props.isWithSnapStart()) {
      return Architecture.X86_64;
    } else {
      return Architecture.ARM_64;
    }
  }

  private Version setupSnapStart() {
    final var defaultChild = function.getNode().getDefaultChild();
    final String uniquenessString = Instant.now().toString();
    // one need a unique name to enforce a creation of a new version
    final var uniqueLogicalId = props.getFunctionName() + "SnapStartPublishedVersion" + uniquenessString;
    if (defaultChild instanceof CfnFunction cfnFunction) {
      cfnFunction.addPropertyOverride("SnapStart", Map.of("ApplyOn", "PublishedVersions"));

      // a fresh logicalId enforces code redeployment
      return Version.Builder.create(this, uniqueLogicalId)
        .lambda(function)
        .description(props.getFunctionName() + " SnapStart " + uniquenessString)
        .build();
    }

    throw new IllegalStateException("Can not create : " + uniqueLogicalId + '.');
  }

  private Alias createAlias(final IVersion version) {
    return Alias.Builder.create(this, props.getFunctionName() + "SnapStartAlias")
      .aliasName("SnapStartAlias")
      .description("this alias is required for SnapStart")
      .version(version)
      .build();
  }

  @Builder
  @Data
  public static class Props {
    private final String functionName;
    private final boolean useS3Bucket;
    private final int timeoutSeconds;
    private final int memory;
    private final boolean withSnapStart;
    private final ITable table;
    private final Code code;
    protected final String deploymentEnvironment;
    private final URI oidcIssuer;
    private final Set<String> jwtAudience;
  }
}
