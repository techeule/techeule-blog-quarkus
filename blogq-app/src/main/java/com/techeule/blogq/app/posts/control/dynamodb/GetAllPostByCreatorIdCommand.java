package com.techeule.blogq.app.posts.control.dynamodb;

import com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter;
import com.techeule.blogq.core.posts.entity.PostEntity;
import lombok.Builder;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.model.AttributeValue;
import software.amazon.awssdk.services.dynamodb.model.QueryRequest;
import software.amazon.awssdk.services.dynamodb.model.QueryResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter.*;
import static java.lang.System.Logger.Level.DEBUG;
import static java.text.MessageFormat.format;

@Builder
public class GetAllPostByCreatorIdCommand {
  private static final System.Logger logger = System.getLogger(GetAllPostByCreatorIdCommand.class.getName());
  private final String tableName;
  private final DynamoDbClient dynamoDbClient;
  private final DynamoDBEntryConverter dynamoDBEntryConverter;
  private final String creatorId;
  private List<PostEntity> postEntityList;

  public List<PostEntity> execute() {

    logger.log(DEBUG, format("Setup the get command for post-get item from '{0}' for with post-id '{1}'", tableName, creatorId));

    fetchAllPosts();
    return postEntityList;
  }


  private void fetchAllPosts() {
    postEntityList = new ArrayList<>(2);
    var queryRequest = createQueryRequestToReadAllTeamRotations();
    var queryResponse = dynamoDbClient.query(queryRequest);
    process(queryResponse);
    while (queryResponse.hasLastEvaluatedKey()) {
      queryRequest = queryRequest.toBuilder().exclusiveStartKey(queryResponse.lastEvaluatedKey()).build();
      queryResponse = dynamoDbClient.query(queryRequest);
      process(queryResponse);
    }
  }


  private QueryRequest createQueryRequestToReadAllTeamRotations() {
    return QueryRequest.builder()
      .tableName(tableName)
      .keyConditionExpression(ALL_TEAM_ROTATION_ITEMS_KEY_CONDITION_EXPRESSION)
      .expressionAttributeNames(Map.of(ITEM_PK, PK_COLUMN_NAME, ITEM_SK, SK_COLUMN_NAME))
      .expressionAttributeValues(Map.of(
        TEAM_ID_VALUE, dynamoDBEntryConverter.createPostPk(creatorId),
        AUTHOR_POST_ID_PREFIX_VALUE, dynamoDBEntryConverter.createValueForPostPrefix()
      ))
      .build();
  }


  private void process(final QueryResponse queryResponse) {
    if (!queryResponse.hasItems()) {
      return;
    }
    queryResponse.items().forEach(this::process);
  }

  private void process(final Map<String, AttributeValue> item) {
    if (item.containsKey(ITEM_TYPE_COLUMN_NAME) && PostEntity.class.getSimpleName().equalsIgnoreCase(item.get(ITEM_TYPE_COLUMN_NAME).s())) {
      postEntityList.add(dynamoDBEntryConverter.convertToPost(item));
    }
  }

}
