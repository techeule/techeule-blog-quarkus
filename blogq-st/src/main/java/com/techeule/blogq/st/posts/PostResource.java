package com.techeule.blogq.st.posts;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@RegisterRestClient(configKey = "apiResources")
@Path("/post")
public interface PostResource {

  @GET
  @Path("/{postId}")
  Response getById(@PathParam("postId") final String id,
                   @HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);
  @DELETE
  @Path("/{postId}")
  Response deleteById(@PathParam("postId") final String id,
                   @HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);
}
