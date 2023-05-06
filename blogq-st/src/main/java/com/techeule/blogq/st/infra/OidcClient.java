package com.techeule.blogq.st.infra;

import jakarta.json.JsonObject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@FunctionalInterface
@RegisterRestClient(configKey = "oidcApi")
@Path("/")
public interface OidcClient {

  @POST
  @Path("/protocol/openid-connect/token")
  @Produces(MediaType.APPLICATION_FORM_URLENCODED)
  @Consumes(MediaType.APPLICATION_JSON)
  JsonObject getToken(@FormParam("username") String username,
                      @FormParam("password") String password,
                      @FormParam("grant_type") String grantType,
                      @FormParam("client_id") String clientId,
                      @FormParam("client_secret") String clientSecret,
                      @FormParam("scope") final String scopes);
}
