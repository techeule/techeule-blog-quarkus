package com.techeule.blogq.infra.stacks.backend;

import com.techeule.blogq.infra.resources.BackendStorage;
import software.amazon.awscdk.RemovalPolicy;
import software.amazon.awscdk.Stack;
import software.amazon.awscdk.StackProps;
import software.constructs.Construct;

public class ApplicationBackendStorageStack extends Stack {
  public static final String APP_NAME = "techeule-blogq";
  private static final String PROD = "prod";
  private final String deploymentEnvironment;
  private BackendStorage backendStorage;

  public ApplicationBackendStorageStack(final Construct scope,
                                        final String id,
                                        final StackProps props,
                                        final String deploymentEnvironment) {
    super(scope, id, props);
    this.deploymentEnvironment = deploymentEnvironment.trim();
    setupStack();
  }

  private void setupStack() {
    final var storageProps = BackendStorage.Props
      .builder()
      .tableName(APP_NAME)
      .provisionedBilling(true)
      .minReadCapacity(1)
      .maxReadCapacity(4)
      .utilizationRead(80)
      .minWriteCapacity(1)
      .maxWriteCapacity(8)
      .utilizationWrite(75)
      .timeToLiveAttribute("expiredAt")
      .tableRemovalPolicy(PROD.equalsIgnoreCase(deploymentEnvironment) ? RemovalPolicy.RETAIN : RemovalPolicy.DESTROY)
      .build();
    backendStorage = new BackendStorage(this, "BlogQStorage", storageProps);
  }

  public BackendStorage getAutomatorStorage() {
    return backendStorage;
  }
}
