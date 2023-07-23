package com.techeule.blogq.core.posts.control;

import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.Optional;
import java.util.Set;

public interface PostsRepository {

  String create(@NotNull final PostEntity newPost);

  Optional<PostEntity> getById(@NotBlank final String id);

  Set<PostEntity> findAll();

  void deleteById(@NotBlank final String id);
}
