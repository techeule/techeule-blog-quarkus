package com.techeule.blogq.core.posts.boundary;

import com.techeule.blogq.core.posts.entity.PostEntity;
import jakarta.annotation.security.RolesAllowed;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

@Tag(name = "post", description = "Post related operations")
@Path("/post/{id}")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
@RolesAllowed({"posts:read"})
public class PostResource {

  @PathParam("id")
  String id;

  @Inject
  PostsService postsService;


  @GET
  @Operation(summary = "Fetch a blog post by Id", description = "Fetch a blog post by Id")
  @APIResponse(responseCode = "200", description = "returns the corresponding blog post",
    content = @Content(mediaType = MediaType.APPLICATION_JSON, schema = @Schema(implementation = PostEntity.class)))
  @APIResponse(responseCode = "404", description = "blog post is not found")
  public Response get() {
    return postsService.getById(id)
      .map(p -> Response.ok(p).build())
      .orElse(Response.status(Response.Status.NOT_FOUND).build());
  }

  @DELETE
  @Operation(summary = "Delete a blog post by Id", description = "Delete a blog post by Id")
  @APIResponse(responseCode = "200", description = "returns no content",
    content = @Content(mediaType = MediaType.APPLICATION_JSON, schema = @Schema()))
  @APIResponse(responseCode = "404", description = "blog post is not found")
  public Response delete() {
    postsService.deleteById(id);
    return Response.accepted().build();
  }
}
