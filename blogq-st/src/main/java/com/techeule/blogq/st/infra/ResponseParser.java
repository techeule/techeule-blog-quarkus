package com.techeule.blogq.st.infra;

import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;
import jakarta.ws.rs.core.Response;

public class ResponseParser {

  private ResponseParser() {
  }

  public static JsonObject parseJsonObject(final Response response) {
    final var entity = response.readEntity(String.class);
    return new JsonObject(entity);
  }

  public static JsonArray parseJsonArray(final Response response) {
    final var readEntity = response.readEntity(String.class);
    return new JsonArray(readEntity);
  }
}
