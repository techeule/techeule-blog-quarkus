# Quarkus Java-Maven template for [TechEule.com](https://techeule.com/)

> All provided paths in this file are relative to the root-folder
> of this git-repository.

At [TechEule.com](https://techeule.com/) you can find more info about this repository.

## Code

> ...

## Requirements

- JDK version 17 or newer
- Maven 3.8 or newer
- Docker (optional)

## How to run and build this project

## Build

### Build the war file

```shell
./mvnw clean package -DskipTests
```

### Build the Docker image

```shell
docker build --progress plain -t t12s/t12s-blogq-quarkus -f ./blogq-app/src/main/docker/simple.Dockerfile .
```

OR

```shell
./mvnw clean package -DskipTests

docker build --progress plain -t t12s/t12s-blogq-quarkus -f ./blogq-app/src/main/docker/simple.Dockerfile .
```

## System Test

The application (blogq-app) should be up and running

```shell
./mvnw clean package -DskipTests && ./environment/build-and-start-env.sh 
```

Wait until the service get deployed and available at `http://localhost:18090/q/health`.

```shell
# Quarkus
./mvnw -V -T 1C clean test-compile failsafe:integration-test failsafe:verify -pl :t12s-blogq-st -Dmp.config.profile=quarkus
```

### Pre-push check

```shell
./mvnw -V -T 1C clean package && \
./environment/build-and-start-env.sh && \
sleep 20 && \
./mvnw -V -T 1C failsafe:integration-test failsafe:verify -pl :blogq-st -Dmp.config.profile=quarkus && \
./environment/stop-infra.sh
```

## Resources

- [AssertJ](https://assertj.github.io/doc/)
- [JUnit5](https://junit.org/junit5/docs/5.9.2/user-guide/)
- [TechEule.com](https://techeule.com/)
