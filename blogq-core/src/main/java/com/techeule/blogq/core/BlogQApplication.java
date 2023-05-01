package com.techeule.blogq.core;

import org.eclipse.microprofile.auth.LoginConfig;
import org.eclipse.microprofile.openapi.annotations.OpenAPIDefinition;
import org.eclipse.microprofile.openapi.annotations.info.Contact;
import org.eclipse.microprofile.openapi.annotations.info.Info;
import org.eclipse.microprofile.openapi.annotations.info.License;
import org.eclipse.microprofile.openapi.annotations.tags.Tag;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

@OpenAPIDefinition(
  tags = {
    @Tag(name = "post", description = "Post related operations"),
    @Tag(name = "posts", description = "Posts related operations")
  },
  info = @Info(
    title = "TechEule - Quarkus Template - BlogQ",
    version = "0.0.1",
    contact = @Contact(
      name = "TechEule",
      url = "https://techeule.com",
      email = "email@techeule.com"),
    license = @License(
      name = "Apache 2.0",
      url = "https://www.apache.org/licenses/LICENSE-2.0.html"),
    description = "This API provides endpoints to manage a blog and its posts"
  )
)
@LoginConfig(authMethod = "MP-JWT")
@ApplicationScoped
@ApplicationPath("/resources")
public class BlogQApplication extends Application {
}
