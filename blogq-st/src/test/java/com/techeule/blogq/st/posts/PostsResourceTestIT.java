package com.techeule.blogq.st.posts;

import com.techeule.blogq.st.infra.ResponseParser;
import com.techeule.blogq.st.infra.TokenProvider;
import io.quarkus.test.junit.QuarkusTest;
import io.vertx.core.json.JsonObject;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.jwt.JsonWebToken;
import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.Instant;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

@QuarkusTest
class PostsResourceTestIT {
  @Inject
  @RestClient
  PostsResource postsResource;
  @Inject
  @RestClient
  PostResource postResource;
  @Inject
  TokenProvider tokenProvider;
  private String authorizationHeaderValue;
  private JsonWebToken jsonWebToken;
  private String adminAccessToken;

  @BeforeEach
  void setUp() {
    adminAccessToken = tokenProvider.getAdminAccessToken();
    authorizationHeaderValue = tokenProvider.asBearerToken(adminAccessToken);
    jsonWebToken = tokenProvider.parse(adminAccessToken);
  }

  @Test
  void createPostTest() {
    final var postMap = Map.of("title", "Java Lang",
      "subtitle", "some lang",
      "content", "very long text",
      "tags", Set.of("java"));
    final var beforeCall = Instant.now();
    try (final var response = postsResource.create(postMap, authorizationHeaderValue)) {
      final var afterCall = Instant.now();
      assertThat(response.getStatusInfo()).isEqualTo(Response.Status.CREATED);
      final var pathSegments = response.getLocation().getPath().split("/");
      final var postId = pathSegments[pathSegments.length - 1];
      assertPostSaved(postId, postMap, beforeCall, afterCall);
    }
  }

  private void assertPostSaved(final String postId, final Map<String, Object> postMap, final Instant beforeCall, final Instant afterCall) {
    try (final var response = postResource.getById(postId, authorizationHeaderValue)) {
      assertThat(response.getStatusInfo()).isEqualTo(Response.Status.OK);
      final var jsonPostEntity = ResponseParser.parseJsonObject(response);
      final var postJson = jsonPostEntity.getJsonObject("post");
      assertPostStringProperty(postMap, postJson, "title");
      assertPostStringProperty(postMap, postJson, "subtitle");
      assertPostStringProperty(postMap, postJson, "content");
      assertPostSetProperty(postMap, postJson, "tags");
      final var createdBy = jsonPostEntity.getString("createdBy");
      assertThat(createdBy).isEqualTo(jsonWebToken.getSubject());

      final var createdAt = jsonPostEntity.getString("createdAt");
      final var createdAtTime = Instant.parse(createdAt);
      assertThat(createdAtTime).isAfterOrEqualTo(beforeCall).isBeforeOrEqualTo(afterCall);

      final var lastModifiedBy = jsonPostEntity.getString("lastModifiedBy");
      assertThat(lastModifiedBy).isEqualTo(jsonWebToken.getSubject());

      final var lastModifiedAt = jsonPostEntity.getString("lastModifiedAt");
      final var lastModifiedAtTime = Instant.parse(lastModifiedAt);
      assertThat(lastModifiedAtTime).isAfterOrEqualTo(beforeCall).isBeforeOrEqualTo(afterCall);
    }
  }

  private static void assertPostStringProperty(final Map<String, Object> postMap, final JsonObject postJson, final String property) {
    assertThat(postJson.getString(property)).isEqualTo(postMap.get(property));
  }

  private static void assertPostSetProperty(final Map<String, Object> postMap, final JsonObject postJson, final String property) {
    final var jsonArray = postJson.getJsonArray(property);
    final var expected = (Set<String>) postMap.get(property);
    final var postTags = new HashSet<String>(1);
    jsonArray.forEach(e -> postTags.add(e.toString()));

    assertThat(jsonArray).hasSize(expected.size());
    assertThat(postTags).isEqualTo(expected);
  }
}