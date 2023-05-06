package com.techeule.blogq.infra.config;

import org.eclipse.microprofile.config.inject.ConfigProperties;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import lombok.Data;

@Data
@ConfigProperties(prefix = "deployment.webapi.lambda")
public class WebApiLambdaConfig {
  @ConfigProperty(name = "t12s.application.environment")
  private String environment;
  @ConfigProperty(name = "t12s.application.runtime", defaultValue = "aws-lambda")
  String runtime;
}
