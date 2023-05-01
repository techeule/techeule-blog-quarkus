package com.techeule.blogq.core.posts.control;

import java.util.Optional;
import java.util.Set;

import com.techeule.blogq.core.posts.entity.Post;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public interface PostsRepository {

  String create(@NotNull final Post newPost);

  Optional<Post> getById(@NotNull final String id);

  Set<Post> findAll();

  Set<Post> findAllByTag(@NotBlank final String tag);

  Set<String> findAlltags();
}
