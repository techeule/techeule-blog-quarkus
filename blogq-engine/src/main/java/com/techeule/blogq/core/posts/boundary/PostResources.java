package com.techeule.blogq.core.posts.boundary;

import com.techeule.blogq.core.posts.entity.Post;
import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.annotation.security.RolesAllowed;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.*;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.enums.SchemaType;
import org.eclipse.microprofile.openapi.annotations.headers.Header;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

@Path("/posts")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
@RolesAllowed({"posts:read"})
@RequestScoped
public class PostResources {
  @Inject
  PostsService postsService;

  @Context
  UriInfo info;

  @Context
  UriBuilder uriBuilder;

  @POST
  @RolesAllowed({"posts:write"})
  @Operation(summary = "Create a new blog post", description = "Create a new blog post")
  @APIResponse(responseCode = "201", description = "Blog Post created successfully",
    headers = @Header(required = true, name = "Location", description = "The URI at which you can find the newly created blog post"))
  public Response create(final Post post) {
    final var postId = postsService.create(post);
    final var uri = info.getBaseUriBuilder().path(PostResource.class).build(postId);
    return Response.created(uri).build();
  }

  @GET
  @Operation(summary = "Fetch all blog posts", description = "Fetch all blog posts")
  @APIResponse(responseCode = "200", description = "Blog posts found successfully", content = @Content(
    schema = @Schema(type = SchemaType.ARRAY, implementation = PostEntity.class)
  ))
  @APIResponse(responseCode = "204", description = "No blog posts could be found")
  public Response getAll() {
    final var posts = postsService.getAll();

    if (posts.isEmpty()) {
      return Response.noContent().build();
    } else {
      return Response.ok(posts).build();
    }
  }

}
