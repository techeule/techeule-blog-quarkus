package com.techeule.blogq.app.posts.control.dynamodb;

import com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter;
import com.techeule.blogq.core.posts.entity.PostEntity;
import lombok.Builder;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.model.GetItemRequest;

import static java.text.MessageFormat.format;
import static java.lang.System.Logger.Level.DEBUG;

@Builder
public class GetPostByIdCommand {
  private static final System.Logger logger = System.getLogger(GetPostByIdCommand.class.getName());

  private final String tableName;
  private final DynamoDbClient dynamoDbClient;
  private final DynamoDBEntryConverter dynamoDBEntryConverter;
  private final String creatorId;
  private final String postId;

  public PostEntity execute() {
    logger.log(DEBUG, format("Setup the get command for post-get item from '{0}' for with post-id '{1}'", tableName, postId));

    final var getItemRequest = createGetItemRequest();
    final var getItemResponse = dynamoDbClient.getItem(getItemRequest);

    if (getItemResponse.hasItem()) {
      logger.log(DEBUG, format("Team found in '{0}' with post-id '{1}'", tableName, postId));
      return dynamoDBEntryConverter.convertToPost(getItemResponse.item());
    }
    logger.log(DEBUG, format("Team not found in '{0}' with post-id '{1}'", tableName, postId));
    return null;
  }

  private GetItemRequest createGetItemRequest() {
    return GetItemRequest.builder()
      .tableName(tableName)
      .key(dynamoDBEntryConverter.convertToPrimaryKey(creatorId, postId))
      .build();
  }
}
