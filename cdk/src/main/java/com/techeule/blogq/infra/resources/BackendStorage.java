package com.techeule.blogq.infra.resources;

import org.jetbrains.annotations.NotNull;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import software.amazon.awscdk.RemovalPolicy;
import software.amazon.awscdk.services.backup.BackupPlan;
import software.amazon.awscdk.services.backup.BackupResource;
import software.amazon.awscdk.services.backup.BackupSelectionOptions;
import software.amazon.awscdk.services.dynamodb.Attribute;
import software.amazon.awscdk.services.dynamodb.AttributeType;
import software.amazon.awscdk.services.dynamodb.BillingMode;
import software.amazon.awscdk.services.dynamodb.EnableScalingProps;
import software.amazon.awscdk.services.dynamodb.ITable;
import software.amazon.awscdk.services.dynamodb.Table;
import software.amazon.awscdk.services.dynamodb.UtilizationScalingProps;
import software.constructs.Construct;

import java.util.List;

public class BackendStorage extends Construct {
  private static final int MIN_CAPACITY = 1;
  @Getter
  private final Props props;
  @Getter
  private ITable table;
  @Getter
  private BackupPlan backupPlan;

  public BackendStorage(@NotNull final Construct scope,
                        @NotNull final String id,
                        final Props props) {
    super(scope, id);
    this.props = props;
    createTable();
    createBackupPlan();
  }

  private void createTable() {
    final Table.Builder builder = Table.Builder.create(this, "DynamoDB-" + props.getTableName())
      .tableName(props.getTableName())
      .partitionKey(Attribute.builder().name("pk").type(AttributeType.STRING).build())
      .sortKey(Attribute.builder().name("sk").type(AttributeType.STRING).build())
      .contributorInsightsEnabled(true)
      .pointInTimeRecovery(true);
    setBillingConfiguration(builder);
    setTTLConfiguration(builder);
    setRemovalPolicy(builder);
    table = builder.build();
    setScalingConfiguration((Table) table);
  }

  private void setScalingConfiguration(final Table table) {
    if (!props.isProvisionedBilling()) {
      return;
    }
    setAutoScalingConfiguration(table);
  }

  private void setAutoScalingConfiguration(final Table table) {
    checkReadWriteCapacityConfiguration();
    final var readUtilizationScalingProps = UtilizationScalingProps.builder()
      .policyName(props.getTableName() +
        "ReadAutoScaling" +
        props.getMinReadCapacity() +
        " => " +
        props.getUtilizationRead() +
        "% => " +
        props.getMaxReadCapacity())
      .targetUtilizationPercent(props.getUtilizationRead())
      .build();

    final var writeUtilizationScalingProps = UtilizationScalingProps.builder()
      .policyName(props.getTableName() +
        "WriteAutoScaling" +
        props.getMinWriteCapacity() +
        " => " +
        props.getUtilizationWrite() +
        "% => " +
        props.getMaxWriteCapacity())
      .targetUtilizationPercent(props.getUtilizationWrite())
      .build();

    table.autoScaleReadCapacity(EnableScalingProps.builder()
        .minCapacity(props.getMinReadCapacity())
        .maxCapacity(props.getMaxReadCapacity())
        .build())
      .scaleOnUtilization(readUtilizationScalingProps);

    table.autoScaleWriteCapacity(EnableScalingProps.builder()
        .minCapacity(props.getMinWriteCapacity())
        .maxCapacity(props.getMaxWriteCapacity())
        .build())
      .scaleOnUtilization(writeUtilizationScalingProps);
  }

  private void checkReadWriteCapacityConfiguration() {
    if (props.getMinReadCapacity() < MIN_CAPACITY) {
      throw new IllegalArgumentException(props.getClass().getName() + ".getMinReadCapacity() < " + MIN_CAPACITY);
    }
    if (props.getMaxReadCapacity() <= props.getMinReadCapacity()) {
      throw new IllegalArgumentException(props.getClass().getName() + "(getMaxReadCapacity() <= getMinReadCapacity())");
    }

    if (props.getMinWriteCapacity() < MIN_CAPACITY) {
      throw new IllegalArgumentException(props.getClass().getName() + ".getMinWriteCapacity() < " + MIN_CAPACITY);
    }
    if (props.getMaxWriteCapacity() <= props.getMinWriteCapacity()) {
      throw new IllegalArgumentException(props.getClass().getName() + "(getMaxWriteCapacity() <= getMinWriteCapacity())");
    }
  }

  private void setRemovalPolicy(final Table.Builder builder) {
    if (props.getTableRemovalPolicy() != null) {
      builder.removalPolicy(props.getTableRemovalPolicy());
    } else {
      builder.removalPolicy(RemovalPolicy.DESTROY);
    }
  }

  private void setTTLConfiguration(final Table.Builder builder) {
    if ((props.getTimeToLiveAttribute() != null) && !props.getTimeToLiveAttribute().isBlank()) {
      builder.timeToLiveAttribute(props.getTimeToLiveAttribute());
    }
  }

  private void setBillingConfiguration(final Table.Builder builder) {
    if (!props.isProvisionedBilling()) {
      builder.billingMode(BillingMode.PAY_PER_REQUEST);
      return;
    }
    checkReadWriteCapacityConfiguration();
    builder.billingMode(BillingMode.PROVISIONED);
  }

  private void createBackupPlan() {
    backupPlan = BackupPlan.dailyMonthly1YearRetention(this, "DynamoDB-Backup-Plan");
    backupPlan.addSelection("DynamoDB-Table" + props.getTableName(),
      BackupSelectionOptions.builder().resources(List.of(BackupResource.fromDynamoDbTable(table))).build());
  }

  @Builder
  @Data
  public static class Props {
    private final String storageBucketName;
    private final String tableName;
    private final String timeToLiveAttribute;
    private final int maxReadCapacity;
    private final int minReadCapacity;
    private final int utilizationRead;
    private final int maxWriteCapacity;
    private final int minWriteCapacity;
    private final int utilizationWrite;
    private final boolean provisionedBilling;
    private final RemovalPolicy tableRemovalPolicy;
  }
}
