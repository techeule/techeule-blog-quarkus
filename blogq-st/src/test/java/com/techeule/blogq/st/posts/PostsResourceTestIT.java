package com.techeule.blogq.st.posts;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Map;
import java.util.Set;

import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.techeule.blogq.st.infra.TokenProvider;

import io.quarkus.test.junit.QuarkusTest;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;

@QuarkusTest
class PostsResourceTestIT {
  @Inject
  @RestClient
  PostsResource postsResource;

  @Inject
  TokenProvider tokenProvider;
  private String authorizationHeaderValue;

  @BeforeEach
  void setUp() {
    authorizationHeaderValue = tokenProvider.asBearerToken(tokenProvider.getAdminAccessToken());
  }

  @Test
  void createPostTest() {
    final var postMap = Map.of("title", "Java Lang",
                               "subtitle", "some lang",
                               "content", "very long text",
                               "tags", Set.of("java"));

    try (final var response = postsResource.create(postMap, authorizationHeaderValue)) {
      assertThat(response.getStatusInfo()).isEqualTo(Response.Status.CREATED);
    }
  }
}