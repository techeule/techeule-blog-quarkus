package com.techeule.blogq.infra.resources;

import java.util.Set;
import java.util.stream.Collectors;

import org.jetbrains.annotations.NotNull;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import software.amazon.awscdk.RemovalPolicy;
import software.amazon.awscdk.services.s3.Bucket;
import software.amazon.awscdk.services.s3.deployment.BucketDeployment;
import software.amazon.awscdk.services.s3.deployment.Source;
import software.constructs.Construct;

public class FrontendUiStorage extends Construct {
  private final Props props;
  @Getter
  private Bucket bucket;

  public FrontendUiStorage(@NotNull final Construct scope,
                           @NotNull final String id,
                           @NotNull final Props props) {
    super(scope, id);
    this.props = props;
    setup();
  }

  private void setup() {
    bucket = Bucket.Builder.create(this, "bucket" + props.getBucketName())
                           .bucketName(props.getBucketName())
                           .enforceSsl(true)
                           .removalPolicy(RemovalPolicy.DESTROY)
                           .build();

    BucketDeployment.Builder.create(this, "deployment" + props.getAppName())
                            .sources(props.getAssets().stream().map(Source::asset).collect(Collectors.toList()))
                            .destinationBucket(bucket)
                            .build();
  }

  @Builder
  @Data
  public static class Props {
    private final String bucketName;
    private final String appName;
    private final Set<String> assets;
  }
}
