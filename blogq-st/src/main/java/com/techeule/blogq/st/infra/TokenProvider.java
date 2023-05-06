package com.techeule.blogq.st.infra;

import io.smallrye.jwt.auth.principal.JWTParser;
import io.smallrye.jwt.auth.principal.ParseException;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.jwt.JsonWebToken;
import org.eclipse.microprofile.rest.client.inject.RestClient;

@ApplicationScoped
public class TokenProvider {
  private static final String SCOPES = "microprofile-jwt";
  private static final String ACCESS_TOKEN_KEY = "access_token";
  private static final String GRANT_TYPE = "password";

  @Inject
  @RestClient
  OidcClient oidcClient;

  @Inject
  @ConfigProperty(name = "app.clientId")
  String appClientId;

  @Inject
  @ConfigProperty(name = "app.clientSecret")
  String appSecret;

  @Inject
  @ConfigProperty(name = "user.admin.username")
  String adminUsername;

  @Inject
  @ConfigProperty(name = "user.admin.password")
  String adminPassword;

  @Inject
  @ConfigProperty(name = "user.author.username")
  String authorUsername;

  @Inject
  @ConfigProperty(name = "user.author.password")
  String authorPassword;

  @Inject
  @ConfigProperty(name = "user.publisher.username")
  String publisherUsername;

  @Inject
  @ConfigProperty(name = "user.publisher.password")
  String publisherPassword;

  @Inject
  JWTParser parser;

  public String getAdminAccessToken() {
    return oidcClient.getToken(adminUsername, adminPassword, GRANT_TYPE, appClientId, appSecret, SCOPES)
                     .getString(ACCESS_TOKEN_KEY);
  }

  public JsonWebToken parse(final String accessToken) {
    try {
      return parser.parse(accessToken);
    } catch (final ParseException e) {
      throw new RuntimeException(e);
    }
  }

  public String getAuthorAccessToken() {
    return oidcClient.getToken(authorUsername, authorPassword, GRANT_TYPE, appClientId, appSecret, SCOPES)
                     .getString(ACCESS_TOKEN_KEY);
  }

  public String getPublisherAccessToken() {
    return oidcClient.getToken(publisherUsername, publisherPassword, GRANT_TYPE, appClientId, appSecret, SCOPES)
                     .getString(ACCESS_TOKEN_KEY);
  }

  public String asBearerToken(final String token) {
    return "Bearer " + token.trim();
  }
}
