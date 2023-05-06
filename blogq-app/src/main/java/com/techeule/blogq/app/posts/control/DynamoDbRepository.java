package com.techeule.blogq.app.posts.control;

import com.techeule.blogq.app.posts.control.dynamodb.CreatePostCommand;
import com.techeule.blogq.app.posts.control.dynamodb.GetAllPostByCreatorIdCommand;
import com.techeule.blogq.app.posts.control.dynamodb.GetPostByIdCommand;
import com.techeule.blogq.app.posts.control.dynamodb.converters.DynamoDBEntryConverter;
import com.techeule.blogq.core.posts.control.PostsRepository;
import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.jwt.Claim;
import org.eclipse.microprofile.jwt.Claims;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;

import java.util.Optional;
import java.util.Set;

@ApplicationScoped
public class DynamoDbRepository implements PostsRepository {
  @Inject
  @ConfigProperty(name = "blogq.storage.dynamodb.table.name", defaultValue = "T12S-Blogq")
  String tableName;
  @Inject
  DynamoDbClient dynamoDbClient;
  @Inject
  DynamoDBEntryConverter dynamoDBEntryConverter;

  @Inject
  @Claim(standard = Claims.sub)
  String userId;

  @Override
  public String create(final PostEntity newPost) {
    return CreatePostCommand.builder()
      .tableName(tableName)
      .dynamoDbClient(dynamoDbClient)
      .dynamoDBEntryConverter(dynamoDBEntryConverter)
      .postEntity(newPost)
      .build()
      .execute()
      .post()
      .id();
  }

  @Override
  public Optional<PostEntity> getById(final String id) {
    final var postEntity = GetPostByIdCommand.builder()
      .tableName(tableName)
      .dynamoDbClient(dynamoDbClient)
      .dynamoDBEntryConverter(dynamoDBEntryConverter)
      .postId(id)
      .creatorId(userId)
      .build()
      .execute();

    return Optional.ofNullable(postEntity);
  }

  @Override
  public Set<PostEntity> findAll() {
    final var postEntityList = GetAllPostByCreatorIdCommand.builder()
      .tableName(tableName)
      .dynamoDbClient(dynamoDbClient)
      .dynamoDBEntryConverter(dynamoDBEntryConverter)
      .creatorId(userId)
      .build()
      .execute();
    return Set.of(postEntityList.toArray(new PostEntity[1]));
  }

}
