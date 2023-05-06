package com.techeule.blogq.st.posts;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import java.util.Map;

@RegisterRestClient(configKey = "apiResources")
@Path("/posts")
public interface PostsResource {

  @POST
  Response create(final Map<?, ?> post,
                  @HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);

  @GET
  Response getAll(@HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);

  @GET
  @Path("/tag/{tag}")
  Response getAllByTag(@PathParam("tag") final String tag,
                       @HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);

  @GET
  @Path("/tags")
  Response getAllTags(@HeaderParam(HttpHeaders.AUTHORIZATION) String authorizationHeaderValue);
}
