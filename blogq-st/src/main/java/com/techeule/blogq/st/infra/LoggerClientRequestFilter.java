package com.techeule.blogq.st.infra;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.ClientRequestContext;
import jakarta.ws.rs.client.ClientRequestFilter;
import jakarta.ws.rs.ext.Provider;

import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;

import static java.lang.System.Logger.Level.INFO;

@Provider
public class LoggerClientRequestFilter implements ClientRequestFilter {
  private static final System.Logger LOGGER = System.getLogger(LoggerClientRequestFilter.class.getName());
  private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

  private static String getClientRequestAsString(final ClientRequestContext clientRequestContext) {
    final var message = new StringBuilder()
      .append(clientRequestContext.getMethod())
      .append(' ')
      .append(clientRequestContext.getUri())
      .append("; ")
      .append("headers{");

    final var first = new AtomicBoolean(true);

    clientRequestContext.getHeaders().forEach((key, value) -> {
      message.append(first.get() ? "" : ", ").append(key).append(':').append(value);
      first.set(false);
    });
    final Object entity = clientRequestContext.getEntity();

    String entityAsString;
    try {
      entityAsString = (entity instanceof String) ? (String) entity : OBJECT_MAPPER.writeValueAsString(entity);
    } catch (final JsonProcessingException e) {
      entityAsString = (Objects.requireNonNullElse(entity, "null")).toString();
    }
    message
      .append("}; ")
      .append("Body:\n\t")
      .append(entityAsString);
    return message.toString();
  }

  @Override
  public void filter(final ClientRequestContext clientRequestContext) {
    LOGGER.log(INFO, getClientRequestAsString(clientRequestContext));
  }
}
