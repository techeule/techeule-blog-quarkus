package com.techeule.blogq.core.posts.boundary;

import java.util.Optional;
import java.util.Set;

import org.eclipse.microprofile.metrics.annotation.Counted;

import com.techeule.blogq.core.posts.control.PostsRepository;
import com.techeule.blogq.core.posts.entity.Post;

import jakarta.annotation.security.RolesAllowed;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@ApplicationScoped
public class PostsService {

  @Inject
  PostsRepository postsRepository;

  @Counted(absolute = true, name = "post_create")
  @RolesAllowed("posts:write")
  public String create(@NotNull final Post post) {
    return postsRepository.create(post);
  }

  @Counted(absolute = true, name = "post_get_by_id")
  @RolesAllowed("posts:read")
  public Optional<Post> getById(@NotBlank final String id) {
    return postsRepository.getById(id);
  }

  @Counted(absolute = true, name = "post_get_all")
  @RolesAllowed("posts:read")
  public Set<Post> getAll() {
    return postsRepository.findAll();
  }

  @Counted(absolute = true, name = "post_get_all_by_tag")
  @RolesAllowed("posts:read")
  public Set<Post> getAllByTag(@NotBlank final String tag) {
    return postsRepository.findAllByTag(tag);
  }

  @Counted(absolute = true, name = "post_get_all_tags")
  @RolesAllowed("posts:read")
  public Set<String> getAllTags() {
    return postsRepository.findAlltags();
  }
}
