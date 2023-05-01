package com.techeule.blogq.core.posts.boundary;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.enums.SchemaType;
import org.eclipse.microprofile.openapi.annotations.headers.Header;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

import com.techeule.blogq.core.posts.entity.Post;

import jakarta.inject.Inject;
import jakarta.validation.constraints.NotBlank;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriBuilder;
import jakarta.ws.rs.core.UriInfo;

@Path("/posts")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class PostResources {
  @Inject
  PostsService postsService;

  @Context
  UriInfo info;

  @Context
  UriBuilder uriBuilder;

  @POST
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
    schema = @Schema(type = SchemaType.ARRAY, implementation = Post.class)
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

  @GET
  @Path("/tag/{tag}")
  @Operation(summary = "Fetch all blog posts with the given tag", description = "Fetch all blog posts with the given tag")
  @APIResponse(responseCode = "200", description = "Blog posts found successfully", content = @Content(
    schema = @Schema(type = SchemaType.ARRAY, implementation = Post.class)
  ))
  @APIResponse(responseCode = "204", description = "No blog posts could be found")
  public Response getAllByTag(@NotBlank @PathParam("tag") final String tag) {
    final var posts = postsService.getAllByTag(tag);

    if (posts.isEmpty()) {
      return Response.noContent().build();
    } else {
      return Response.ok(posts).build();
    }
  }

  @GET
  @Path("/tags")
  @Operation(summary = "Fetch all tags", description = "Fetch all tags")
  @APIResponse(responseCode = "200", description = "Blog post tags found successfully", content = @Content(
    schema = @Schema(type = SchemaType.ARRAY, implementation = String.class)
  ))
  @APIResponse(responseCode = "204", description = "No blog post tags could be found")
  public Response getAllTags() {
    final var allTags = postsService.getAllTags();

    if (allTags.isEmpty()) {
      return Response.noContent().build();
    } else {
      return Response.ok(allTags).build();
    }
  }
}
