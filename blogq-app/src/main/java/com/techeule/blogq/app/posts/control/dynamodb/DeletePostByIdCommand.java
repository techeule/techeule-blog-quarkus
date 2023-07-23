package com.techeule.blogq.app.posts.control.dynamodb;

import com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter;
import lombok.Builder;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.model.DeleteItemRequest;

import static java.lang.System.Logger.Level.DEBUG;
import static java.text.MessageFormat.format;

@Builder
public class DeletePostByIdCommand {
  private static final System.Logger logger = System.getLogger(DeletePostByIdCommand.class.getName());

  private final String tableName;
  private final DynamoDbClient dynamoDbClient;
  private final DynamoDBEntryConverter dynamoDBEntryConverter;
  private final String creatorId;
  private final String postId;

  public void execute() {
    logger.log(DEBUG, format("Setup the get command for post-delete item from '{0}' for with post-id '{1}'", tableName, postId));
    final var itemRequest = createDeleteItemRequest();
    dynamoDbClient.deleteItem(itemRequest);
  }

  private DeleteItemRequest createDeleteItemRequest() {
    return DeleteItemRequest.builder()
      .tableName(tableName)
      .key(dynamoDBEntryConverter.convertToPrimaryKey(creatorId, postId))
      .build();
  }
}
