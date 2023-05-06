package com.techeule.blogq.app.posts.control.dynamodb.converters;

import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.json.bind.Jsonb;
import software.amazon.awssdk.services.dynamodb.model.AttributeValue;

import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.HashMap;
import java.util.Map;

@ApplicationScoped
public class DynamoDBEntryConverter {
  private static final String POST_SK_PREFIX = "posts";
  private static final String POST_PK_PREFIX = "author";
  private static final String DELIMITER = "#";
  public static final String PK_COLUMN_NAME = "pk";
  public static final String SK_COLUMN_NAME = "sk";
  private static final String CREATED_AT_COLUMN_NAME = "createdAt";
  private static final String MODIFIED_AT_COLUMN_NAME = "modifiedAt";
  private static final String PAYLOAD_AT_COLUMN_NAME = "dataPayload";
  public static final String ITEM_TYPE_COLUMN_NAME = "iType";
  public static final String ITEM_PK = "#itemPk";
  public static final String ITEM_SK = "#itemSk";
  public static final String TEAM_ID_VALUE = ":authorId";
  public static final String AUTHOR_POST_ID_PREFIX_VALUE = ":authorPostPrefix";

  public static final String ALL_TEAM_ROTATION_ITEMS_KEY_CONDITION_EXPRESSION = ITEM_PK + " = " + TEAM_ID_VALUE +
    " AND begins_with(" + ITEM_SK + ", " + AUTHOR_POST_ID_PREFIX_VALUE + ')';

  @Inject
  Jsonb jsonb;

  static AttributeValue createPostSk(final String postId) {
    return AttributeValue.builder().s(POST_SK_PREFIX + DELIMITER + postId.toLowerCase()).build();
  }

//
//  static String convertPostSk(final AttributeValue attributeValue) {
//    return Optional.ofNullable(attributeValue)
//      .map(AttributeValue::s)
//      .map(String::trim)
//      .filter(s -> s.startsWith(POST_SK_PREFIX))
//      .map(s -> s.split(DELIMITER, 2))
//      .filter(a -> a.length > 1)
//      .map(a -> a[1])
//      .get();
//  }


  public AttributeValue createPostPk(final String authorId) {
    return AttributeValue.builder().s(POST_PK_PREFIX + DELIMITER + authorId.toLowerCase()).build();
  }

//
//  static String convertPostPk(final AttributeValue attributeValue) {
//    return Optional.ofNullable(attributeValue)
//      .map(AttributeValue::s)
//      .map(String::trim)
//      .filter(s -> s.startsWith(POST_PK_PREFIX))
//      .map(s -> s.split(DELIMITER, 2))
//      .filter(a -> a.length > 1)
//      .map(a -> a[1])
//      .get();
//  }

  static AttributeValue createTemporalAccessor(final TemporalAccessor instant) {
    return AttributeValue.builder().s(DateTimeFormatter.ISO_INSTANT.format(instant)).build();
  }

  public Map<String, AttributeValue> convertToItem(final PostEntity postEntity) {
    final Map<String, AttributeValue> valuesMap = new HashMap<>(3);
    valuesMap.put(PK_COLUMN_NAME, createPostPk(postEntity.createdBy().toLowerCase()));
    valuesMap.put(SK_COLUMN_NAME, createPostSk(postEntity.post().id().toLowerCase()));
    valuesMap.put(CREATED_AT_COLUMN_NAME, createTemporalAccessor(postEntity.createdAt()));
    valuesMap.put(MODIFIED_AT_COLUMN_NAME, createTemporalAccessor(postEntity.lastModifiedAt()));
    valuesMap.put(ITEM_TYPE_COLUMN_NAME, AttributeValue.builder().s(postEntity.getClass().getSimpleName()).build());
    valuesMap.put(PAYLOAD_AT_COLUMN_NAME, AttributeValue.builder().s(jsonb.toJson(postEntity)).build());
    return valuesMap;
  }

  public PostEntity convertToPost(final Map<String, AttributeValue> valuesMap) {
    final var attributeValue = valuesMap.get(PAYLOAD_AT_COLUMN_NAME);
    return jsonb.fromJson(attributeValue.s(), PostEntity.class);
  }

  public Map<String, AttributeValue> convertToPrimaryKey(final String author, final String postId) {
    return Map.of(
      PK_COLUMN_NAME, createPostPk(author.toLowerCase()),
      SK_COLUMN_NAME, createPostSk(postId.toLowerCase())
    );
  }

  public AttributeValue createValueForPostPrefix() {
    return AttributeValue.builder().s(POST_SK_PREFIX + DELIMITER).build();
  }

}
