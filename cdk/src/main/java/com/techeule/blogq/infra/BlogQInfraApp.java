package com.techeule.blogq.infra;

import java.net.URI;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.techeule.blogq.infra.resources.BackendStorage;
import com.techeule.blogq.infra.stacks.frontend.ApplicationFrontendCertificateStack;
import com.techeule.blogq.infra.stacks.frontend.ApplicationFrontendStack;
import org.eclipse.microprofile.config.Config;
import org.eclipse.microprofile.config.ConfigProvider;
import org.jetbrains.annotations.NotNull;

import com.techeule.blogq.infra.stacks.backend.ApplicationBackendStack;
import com.techeule.blogq.infra.stacks.backend.ApplicationBackendStorageStack;
import lombok.ToString;
import software.amazon.awscdk.App;
import software.amazon.awscdk.Environment;
import software.amazon.awscdk.StackProps;
import software.amazon.awscdk.Tags;

@ToString
public class BlogQInfraApp {
  private static final String APPLICATION_BACKEND_NAME = "techeule-blogq-api";
  private static final String APPLICATION_FRONTEND_NAME = "techeule-blogq-app";
  private static final String APPLICATION_FRONTEND_NAME_CERT = APPLICATION_FRONTEND_NAME + "-certificate";
  private static final Set<String> WEB_APP_SOURCES = Set.of("../blogq-web-ui/dist");
  private final Config config;
  private final App app;
  private final String deploymentAccountId;
  private final String deploymentRegion;
  private final String deploymentEnvironment;
  private final String webApiSubdomain;
  private final String webApiRootDomain;
  private final String webAppStorageBucket;
  private final String webAppSubDomain;
  private final String webAppRootDomain;
  private final Environment environment;
  private final String webAppCertificateArn;
  private final Map<String, String> projectTags;
  private final Set<String> webApiAllowedOrigins;
  private final Set<String> stackNames = new HashSet<>();
  private final int webApiLambdaMemory;
  private final String oidcIssuer;
  private final Set<String> jwtAudience;
  private ApplicationBackendStorageStack applicationBackendStorageStack;
  private ApplicationBackendStack applicationBackendStack;
  private ApplicationFrontendCertificateStack applicationFrontendCertificateStack;
  private ApplicationFrontendStack applicationFrontendStack;

  public static void main(final String[] args) {
    final String depEnv = System.getenv("DEP_ENV");
    if ((depEnv != null) && !depEnv.isBlank()) {
      System.out.println("Using mp.config.profile=" + depEnv);
      System.setProperty("mp.config.profile", depEnv);
    }
    new BlogQInfraApp().synth();
  }

  public BlogQInfraApp() {
    config = ConfigProvider.getConfig();
    deploymentAccountId = config.getValue("deployment.accountId", String.class);
    deploymentRegion = config.getValue("deployment.region", String.class);
    deploymentEnvironment = config.getValue("deployment.environment", String.class);
    webApiLambdaMemory = config.getValue("deployment.webapi.lambda.memoryMb", Integer.class);
    webApiSubdomain = config.getValue("deployment.webapi.subDomain", String.class);
    webApiRootDomain = config.getValue("deployment.webapi.rootDomain", String.class);
    oidcIssuer = config.getValue("deployment.webapi.oidcIssuer", String.class);
    jwtAudience = Set.of(config.getValue("deployment.webapi.jwtAudience", String[].class));
    webAppStorageBucket = config.getValue("deployment.webapp.bucket", String.class);
    webAppSubDomain = config.getValue("deployment.webapp.subDomain", String.class);
    webAppRootDomain = config.getValue("deployment.webapp.rootDomain", String.class);
    webAppCertificateArn = config.getValue("deployment.webapp.certificateArn", String.class);
    projectTags = Map.of("Project", "techeule-blogq", "Environment", deploymentEnvironment);
    environment = Environment.builder().account(deploymentAccountId).region(deploymentRegion).build();
    webApiAllowedOrigins = Set.of("http://localhost:5173", "http://localhost:15173", "https://" + webAppSubDomain + '.' + webAppRootDomain);
    app = new App();
    projectTags.forEach((k, v) -> Tags.of(app).add(k, v));
  }

  private void synth() {
    System.out.println(this);
    setup();
    app.synth();
  }

  private void setup() {
    applicationBackendStorageStack = createAutomatorBackendWebApiStorageStack();
    applicationBackendStack = createAutomatorBackendWebApiStack(applicationBackendStorageStack.getAutomatorStorage());
    applicationBackendStack.addDependency(applicationBackendStorageStack);
    applicationFrontendCertificateStack = createAutomatorFrontendWebAppCertificateStack();
    applicationFrontendStack = createAutomatorFrontendWebAppStack();
  }

  @NotNull
  private ApplicationBackendStorageStack createAutomatorBackendWebApiStorageStack() {
    final String stackName = APPLICATION_BACKEND_NAME + "-storage";
    if (!stackNames.add(stackName)) {
      System.err.println("StackName " + stackName + " does already exists");
      System.exit(1);
    }
    final var stack = new ApplicationBackendStorageStack(app,
      stackName,
      StackProps.builder()
        .tags(getTagsForApp(stackName))
        .env(environment)
        .build(),
      deploymentEnvironment);

    System.out.println(stack.getClass().getSimpleName() + " called " + stackName);
    return stack;
  }

  @NotNull
  private ApplicationBackendStack createAutomatorBackendWebApiStack(final BackendStorage backendStorage) {
    if (!stackNames.add(APPLICATION_BACKEND_NAME)) {
      System.err.println("StackName " + APPLICATION_BACKEND_NAME + " does already exists");
      System.exit(1);
    }
    final var stack = new ApplicationBackendStack(app,
      APPLICATION_BACKEND_NAME,
      StackProps.builder()
        .tags(getTagsForApp(APPLICATION_BACKEND_NAME))
        .env(environment)
        .build(),
      webApiSubdomain,
      webApiRootDomain,
      webApiAllowedOrigins,
      backendStorage,
      webApiLambdaMemory,
      deploymentEnvironment,
      URI.create(oidcIssuer),
      jwtAudience);
    System.out.println(stack.getClass().getSimpleName() + " called " + APPLICATION_BACKEND_NAME);
    return stack;
  }

  @NotNull
  private ApplicationFrontendCertificateStack createAutomatorFrontendWebAppCertificateStack() {
    if (!stackNames.add(APPLICATION_FRONTEND_NAME_CERT)) {
      System.err.println("StackName " + APPLICATION_FRONTEND_NAME_CERT + " does already exists");
      System.exit(1);
    }
    final var stack = new ApplicationFrontendCertificateStack(app,
      APPLICATION_FRONTEND_NAME_CERT,
      StackProps.builder()
        .tags(getTagsForApp(APPLICATION_FRONTEND_NAME_CERT))
        .env(environment)
        .build(),
      webAppSubDomain,
      webAppRootDomain);
    System.out.println(stack.getClass().getSimpleName() + " called " + APPLICATION_FRONTEND_NAME_CERT);
    return stack;
  }

  @NotNull
  private ApplicationFrontendStack createAutomatorFrontendWebAppStack() {
    if (!stackNames.add(APPLICATION_FRONTEND_NAME)) {
      System.err.println("StackName " + APPLICATION_FRONTEND_NAME + " does already exists");
      System.exit(1);
    }
    final ApplicationFrontendStack stack = new ApplicationFrontendStack(app,
      APPLICATION_FRONTEND_NAME,
      StackProps.builder()
        .tags(getTagsForApp(APPLICATION_FRONTEND_NAME))
        .env(environment)
        .build(),
      webAppSubDomain,
      webAppRootDomain,
      webAppCertificateArn,
      webAppStorageBucket,
      WEB_APP_SOURCES);
    System.out.println(stack.getClass().getSimpleName() + " called " + APPLICATION_FRONTEND_NAME);
    return stack;
  }

  @NotNull
  private Map<String, String> getTagsForApp(final String applicationName) {
    final Map<String, String> tagsForApp = new HashMap<>(projectTags);
    tagsForApp.put("Application", applicationName);
    return tagsForApp;
  }
}

