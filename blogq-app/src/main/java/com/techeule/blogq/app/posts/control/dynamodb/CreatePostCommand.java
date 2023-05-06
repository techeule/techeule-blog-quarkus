package com.techeule.blogq.app.posts.control.dynamodb;

import com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter;
import com.techeule.blogq.core.posts.entity.Post;
import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.ws.rs.BadRequestException;
import lombok.Builder;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.model.DynamoDbException;
import software.amazon.awssdk.services.dynamodb.model.PutItemRequest;
import software.amazon.awssdk.services.dynamodb.model.PutItemResponse;

import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import static java.lang.System.Logger.Level.*;
import static java.text.MessageFormat.format;

@Builder
public class CreatePostCommand {
  private static final System.Logger logger = System.getLogger(CreatePostCommand.class.getName());

  private final String tableName;
  private final DynamoDbClient dynamoDbClient;
  private final DynamoDBEntryConverter dynamoDBEntryConverter;
  private final PostEntity postEntity;

  public PostEntity execute() {
    final var newPost = postEntity.post();
    final var postId = UUID.randomUUID().toString();
    final var post = new Post(postId, newPost.title(), newPost.subtitle(), newPost.content(), normalizeTags(newPost.tags()));
    final var newPostEntry = new PostEntity(
      postEntity.createdBy(),
      postEntity.createdAt(),
      postEntity.lastModifiedBy(),
      postEntity.lastModifiedAt(),
      post
    );

    final var putItemRequest = createPostIfDoesNotExist(newPostEntry);

    try {
      tryPutItem(putItemRequest);
    } catch (final DynamoDbException e) {
      throw handleExceptions(e);
    }

    return newPostEntry;
  }

  private RuntimeException handleExceptions(final DynamoDbException dynamoDbException) {
    final var errorMessage = format("can not create post in {0}", tableName);
    logger.log(WARNING, errorMessage, dynamoDbException);
    return new BadRequestException(errorMessage);
  }

  private PutItemRequest createPostIfDoesNotExist(final PostEntity postEntity) {
    return PutItemRequest.builder()
      .tableName(tableName)
      .item(dynamoDBEntryConverter.convertToItem(postEntity))
      .build();
  }

  private void tryPutItem(final PutItemRequest putItemRequest) {
    logger.log(DEBUG, format("Sending {0} '{1}'-DynamoDB table for Team {2}", PutItemRequest.class.getSimpleName(), tableName, postEntity));
    final var putItemResponse = dynamoDbClient.putItem(putItemRequest);
    logger.log(DEBUG, format("Sent {0} '{1}'-DynamoDB table for Team {2}", PutItemRequest.class.getSimpleName(), tableName, postEntity));
    handleResponse(putItemResponse);
  }

  private void handleResponse(final PutItemResponse putItemResponse) {
    if (putItemResponse == null) {
      return;
    }
    logger.log(DEBUG, format("Created DynamoDB item in '{0}' for Team {1}", tableName, postEntity));
  }

  private static Set<String> normalizeTags(final Set<String> tags) {
    if (tags == null) {
      return Set.of();
    }

    return tags.stream()
      .map(String::trim)
      .map(String::toLowerCase)
      .collect(Collectors.toSet());
  }
}
