# blogq-backend

This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: https://quarkus.io/ .

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:

```shell script
./mvnw compile quarkus:dev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at http://localhost:8080/q/dev/.

## Packaging and running the application

The application can be packaged using:

```shell script
./mvnw package
```

It produces the `quarkus-run.jar` file in the `target/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/quarkus-app/lib/` directory.

The application is now runnable using `java -jar target/quarkus-app/quarkus-run.jar`.

If you want to build an _über-jar_, execute the following command:

```shell script
./mvnw package -Dquarkus.package.type=uber-jar
```

The application, packaged as an _über-jar_, is now runnable using `java -jar target/*-runner.jar`.

## Creating a native executable

You can create a native executable using:

```shell script
./mvnw package -Pnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using:

```shell script
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./target/blogq-backend-1.0-SNAPSHOT-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/maven-tooling.

## Related Guides

- AWS Lambda ([guide](https://quarkus.io/guides/amazon-lambda)): Write AWS Lambda functions
- JSON-B ([guide](https://quarkus.io/guides/rest-json)): JSON Binding support
- REST Client Classic ([guide](https://quarkus.io/guides/rest-client)): Call REST services
- RESTEasy Classic JSON-B ([guide](https://quarkus.io/guides/rest-json)): JSON-B serialization support for RESTEasy Classic
- SmallRye Fault Tolerance ([guide](https://quarkus.io/guides/smallrye-fault-tolerance)): Build fault-tolerant network services
- Amazon DynamoDB ([guide](https://quarkiverse.github.io/quarkiverse-docs/quarkus-amazon-services/dev/amazon-dynamodb.html)): Connect to
  Amazon DynamoDB datastore
- RESTEasy Classic ([guide](https://quarkus.io/guides/resteasy)): REST endpoint framework implementing Jakarta REST and more
- SmallRye JWT ([guide](https://quarkus.io/guides/security-jwt)): Secure your applications with JSON Web Token
- Logging JSON ([guide](https://quarkus.io/guides/logging#json-logging)): Add JSON formatter for console logging
- SmallRye Health ([guide](https://quarkus.io/guides/smallrye-health)): Monitor service health
- Amazon S3 ([guide](https://quarkiverse.github.io/quarkiverse-docs/quarkus-amazon-services/dev/amazon-s3.html)): Connect to Amazon S3 cloud
  storage
- SmallRye Metrics ([guide](https://quarkus.io/guides/smallrye-metrics)): Expose metrics for your services
- Amazon SES ([guide](https://quarkiverse.github.io/quarkiverse-docs/quarkus-amazon-services/dev/amazon-ses.html)): Connect to Amazon SES
- Keycloak Authorization ([guide](https://quarkus.io/guides/security-keycloak-authorization)): Policy enforcer using Keycloak-managed
  permissions to control access to protected resources
- Hibernate Validator ([guide](https://quarkus.io/guides/validation)): Validate object properties (field, getter) and method parameters for
  your beans (REST, CDI, Jakarta Persistence)
- SmallRye OpenAPI ([guide](https://quarkus.io/guides/openapi-swaggerui)): Document your REST APIs with OpenAPI - comes with Swagger UI
- OpenTelemetry ([guide](https://quarkus.io/guides/opentelemetry)): Use OpenTelemetry to trace services
- SmallRye JWT Build ([guide](https://quarkus.io/guides/security-jwt-build)): Create JSON Web Token with SmallRye JWT Build API

## Provided Code

### Amazon Lambda Integration example

This example contains a Quarkus Greeting Lambda ready for Amazon.

[Related guide section...](https://quarkus.io/guides/amazon-lambda)

> :warning: **INCOMPATIBLE WITH DEV MODE**: Amazon Lambda Binding is not compatible with dev mode yet!

