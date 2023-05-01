package com.techeule.blogq.st.infra;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@FunctionalInterface
@RegisterRestClient(configKey = "sysApi")
@Path("/metrics")
public interface MetricsClient {

  @GET
  @Path("/application")
  @Produces(MediaType.APPLICATION_JSON)
  Response application();
}
