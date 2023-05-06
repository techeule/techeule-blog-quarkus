package com.techeule.blogq.core.posts.boundary;

import com.techeule.blogq.core.posts.control.PostsRepository;
import com.techeule.blogq.core.posts.entity.Post;
import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.annotation.security.RolesAllowed;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.eclipse.microprofile.jwt.JsonWebToken;
import org.eclipse.microprofile.metrics.annotation.Counted;

import java.time.Instant;
import java.util.Optional;
import java.util.Set;

@ApplicationScoped
@RolesAllowed("posts:read")
public class PostsService {

  @Inject
  PostsRepository postsRepository;

  @Inject
  JsonWebToken token;

  @Counted(absolute = true, name = "post_create")
  @RolesAllowed("posts:write")
  public String create(@NotNull final Post post) {
    final var now = Instant.now();
    final var author = token.getSubject();
    return postsRepository.create(new PostEntity(author, now, author, now, post));
  }

  @Counted(absolute = true, name = "post_get_by_id")
  public Optional<PostEntity> getById(@NotBlank final String id) {
    return postsRepository.getById(id);
  }

  @Counted(absolute = true, name = "post_get_all")
  public Set<PostEntity> getAll() {
    return postsRepository.findAll();
  }

}
