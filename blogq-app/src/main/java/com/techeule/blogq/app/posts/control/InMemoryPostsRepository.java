package com.techeule.blogq.app.posts.control;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import com.techeule.blogq.core.posts.control.PostsRepository;
import com.techeule.blogq.core.posts.entity.Post;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class InMemoryPostsRepository implements PostsRepository {
  private static final Post[] POSTS_ARRAY = new Post[0];
  private final Map<String, Post> idToPostMap = new HashMap<>(10);

  @Override
  public String create(final Post newPost) {
    final var postId = UUID.randomUUID().toString();
    final var post = new Post(postId, newPost.title(), newPost.subtitle(), newPost.content(), normalizeTags(newPost.tags()));
    idToPostMap.put(postId, post);
    return postId;
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

  @Override
  public Optional<Post> getById(final String id) {
    return Optional.ofNullable(idToPostMap.get(id));
  }

  @Override
  public Set<Post> findAll() {
    return Set.of(idToPostMap.values().toArray(POSTS_ARRAY));
  }

  @Override
  public Set<Post> findAllByTag(final String tag) {
    if ((tag == null) || tag.trim().isEmpty()) {
      return Set.of();
    }
    return idToPostMap.values().stream().filter(p -> p.tags().contains(tag.trim().toLowerCase())).collect(Collectors.toSet());
  }

  @Override
  public Set<String> findAlltags() {
    return idToPostMap.values().stream().flatMap(p -> p.tags().stream()).collect(Collectors.toSet());
  }
}
