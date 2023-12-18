#!groovy

pipeline {

  agent { label 'ci' }
  options {
    timeout(time: 30, unit: 'MINUTES')
  }

  tools {
    jdk 'jdk-21'
  }

  stages {
    stage('Clean Working Directory And Checkout') {
      steps {
        deleteDir()
        checkout scm
      }
    }

    stage("Build and Test") {
      steps {
        sh "./mvnw -V -T 1C -B --no-transfer-progress clean install -pl '!:blogq-st,!:cdk'"
        // junit '**/target/*-reports/*.xml'

        sh "./mvnw -V -T 1C -B --no-transfer-progress versions:dependency-updates-report"
        archiveArtifacts artifacts: "**/target/site/**"

        dir('blogq-web-ui') {
          sh "pnpm install"
        }
      }
    }

    stage("Setup Environment") {
      steps {
        script {
          sh """
           chmod +x environment/*.sh
           chmod +x ci-cd/*.sh
           ./environment/stop-infra.sh || true
           
          cat /etc/hosts 
          set -x
          
          if ! grep -q 't12s-oidc-keycloak' "/etc/hosts"; then
            echo "127.0.0.1    t12s-oidc-keycloak" | sudo tee -a /etc/hosts
          fi
                    
          set +x
          
          cat /etc/hosts | grep 't12s-oidc-keycloak'
           ./environment/build-and-start-env.sh
          """.stripIndent()
        }
      }
    }

    stage('Sys-IT-Tests: Quarkus') {
      steps {
        script {
          sh "./ci-cd/wait_for_url.sh 120 'http://localhost:51080/q/health'"
          sh "./mvnw -V -T 1C -B --no-transfer-progress clean test-compile " +
            " failsafe:integration-test " +
            " failsafe:verify " +
            " -pl :blogq-st " +
            " -Dmaven.test.failure.ignore=true " +
            " -Dmp.config.profile=quarkus "

          junit '**/target/*-reports/*.xml'
        }
      }
    }

    stage('Deploy develop on staging') {
      when {
        branch 'develop'
      }
      steps {
        build(
          job: 'T12S-BlogQ/T12S-BlogQ-Deploy',
          parameters: [
            gitParameter(name: 'GIT_BRANCH', value: "develop"),
            string(name: 'ENV', value: "staging"),
            string(name: 'STACK', value: "_ALL_STACKS_"),
            booleanParam(name: "UI_CERTIFICATE_ONLY", value: false)
          ],
          wait: false,
          propagate: false
        )
      }
    }

    stage('Deploy release on prod') {
      when {
        allOf {
          buildingTag()
          tag pattern: "(v|V)?\\d+\\.\\d+\\.\\d+", comparator: "REGEXP"
        }
      }
      steps {
        build(
          job: 'T12S-BlogQ/T12S-BlogQ-Deploy',
          parameters: [
            gitParameter(name: 'GIT_BRANCH', value: "${env.TAG_NAME}"),
            string(name: 'ENV', value: "prod"),
            string(name: 'STACK', value: "_ALL_STACKS_"),
            booleanParam(name: "UI_CERTIFICATE_ONLY", value: false)
          ],
          wait: false,
          propagate: false
        )
      }
    }

  }

  post {
    always {
      script {
        sh "./environment/stop-infra.sh || true"
        deleteDir()
      }
    }
  }
}


