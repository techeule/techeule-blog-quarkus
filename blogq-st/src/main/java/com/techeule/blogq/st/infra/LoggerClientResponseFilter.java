package com.techeule.blogq.st.infra;

import static java.lang.System.Logger.Level.INFO;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;

import jakarta.ws.rs.client.ClientRequestContext;
import jakarta.ws.rs.client.ClientResponseContext;
import jakarta.ws.rs.client.ClientResponseFilter;
import jakarta.ws.rs.ext.Provider;

@Provider
public class LoggerClientResponseFilter implements ClientResponseFilter {
  private static final System.Logger LOGGER = System.getLogger(LoggerClientResponseFilter.class.getName());

  @Override
  public void filter(final ClientRequestContext clientRequestContext,
                     final ClientResponseContext responseContext) throws IOException {
    final var responseMessage = getClientResponseAsString(responseContext);
    LOGGER.log(INFO, responseMessage);
  }

  private static String getClientResponseAsString(final ClientResponseContext responseContext) {
    final var message = new StringBuilder()
      .append(responseContext.getStatus())
      .append("; ")
      .append("headers{");

    final var first = new AtomicBoolean(true);

    responseContext.getHeaders().forEach((key, value) -> {
      message.append(first.get() ? "" : ", ").append(key).append(':').append(value);
      first.set(false);
    });
    message
      .append("}; ")
      .append("Has Body:")
      .append(responseContext.hasEntity());
    return message.toString();
  }
}
