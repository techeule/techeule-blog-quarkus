package com.techeule.blogq.st.posts;

import java.util.Map;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.HeaderParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.Response;

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
