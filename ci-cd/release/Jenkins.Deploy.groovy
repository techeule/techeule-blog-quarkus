#!groovy

@Library('pkgv-t12slabs-shared-library') _
import com.t12slabs.jenkins.T12sContext

final def t12sBlogQApiStack = "techeule-blogq-api"
final def allowedStacks = [
  "_ALL_STACKS_",
  t12sBlogQApiStack,
  "techeule-blogq-api-storage",
  "techeule-blogq-app"
]

final def allowedEnvironments = ["staging"]

pipeline {

  agent { label 'ci-small' }

  options {
    timeout(time: 120, unit: 'MINUTES')
    lock resource: "t12s-blogq-deployment-${params.ENV}"
  }

  tools {
    jdk 'jdk-17'
  }

  parameters {
    gitParameter(name: 'GIT_BRANCH', branchFilter: '.*', defaultValue: 'develop', type: 'PT_BRANCH_TAG', sortMode: 'DESCENDING_SMART', description: 'Which git branch/tag should be used')
    choice(name: 'ENV', choices: allowedEnvironments, description: 'AWS Account')
    choice(name: 'STACK', choices: allowedStacks, description: 'Infrastructure Stack(s)')
    booleanParam(name: 'UI_CERTIFICATE_ONLY', defaultValue: false, description: 'Deploy only UI Certificate')
  }

  stages {
    stage('prepare job setup') {
      steps {
        deleteDir()
        checkout scm
        script {
          if (!(params.ENV in allowedEnvironments)) {
            error("Invalid ENV: '${ENV}' is not in ${allowedEnvironments}.")
          }
          if (!(params.STACK in allowedStacks)) {
            error("Invalid STACK '${params.STACK}', it is not onw of ${allowedStacks}.")
          }

          env.ENV = "${params.ENV}"
          env.DEP_ENV = "${env.ENV}"
          env.UI_CERTIFICATE_ONLY = "${params.UI_CERTIFICATE_ONLY}"
          env.AWS_CREDENTIALS = T12sContext.get("T12S_BLOGQ", "${env.ENV}", 'AWS_CREDENTIALS_ID')
          env.AWS_ACCOUNT_ID = T12sContext.get("T12S_BLOGQ", "${env.ENV}", 'AWS_ACCOUNT_ID')
          env.AWS_DNS_ZONE_ID = T12sContext.get("T12S_BLOGQ", "${env.ENV}", 'AWS_DNS_ZONE_ID')
          env.DNS_RECORD_NAME = 'te-blogq-api'
          env.DNS_RECORD_NAME_UI = 'te-blogq'
          env.REGION = T12sContext.get("T12S_BLOGQ", "${env.ENV}", 'AWS_REGION')
          env.ROOT_DOMAIN = T12sContext.get("T12S_BLOGQ", "${env.ENV}", 'ROOT_DOMAIN_NAME')

          if ("_ALL_STACKS_" == params.STACK) {
            env.STACKS = String.join(" ", allowedStacks).replace("${params.STACK}" as CharSequence, "")
          } else {
            env.STACKS = "${params.STACK}"
          }

          currentBuild.description = "Deploying '${params.STACK}' in '${env.ENV}' from '${params.GIT_BRANCH}'"
        }
      }
    }

    stage('prepare infra and build app') {
      steps {
        parallel(
          'infrastructure configuration setup': {
            script {
              echo "#Update Infrastructure Configuration"
              env.infrastructureConfigFile = "cdk/src/main/resources/META-INF/microprofile-config-${env.ENV}.properties"
              final def infrastructureParameters = [
                DEP_ACCOUNT_ID       : "${AWS_ACCOUNT_ID}",
                DEP_REGION           : "${REGION}",
                DEP_ENV              : "${ENV}",
                WEB_APP_SUBDOMAIN    : "${DNS_RECORD_NAME_UI}",
                WEB_APP_ROOTDOMAIN   : "${ROOT_DOMAIN}",
                WEB_API_SUBDOMAIN    : "${DNS_RECORD_NAME}",
                WEB_API_ROOTDOMAIN   : "${ROOT_DOMAIN}",
                WEB_APP_BUCKET       : "${env.DNS_RECORD_NAME_UI}-${env.AWS_ACCOUNT_ID}-${env.ENV}",
                WEB_API_OIDC_ISSUER  : "https://idp-staging.t12slabs.com/realms/blogq",
                WEB_API_OIDC_AUDIENCE: "blogq-backend"
              ]
              for (final parameter in infrastructureParameters) {
                sedReplaceInFile("__${parameter.key}__", "${parameter.value}", "${env.infrastructureConfigFile}")
              }

              sh "chmod +x ci-cd/release/*.sh"
            }
          },
          'application backend build': {
            script {
              echo "#Build Application"
              sh "mvn -B --no-transfer-progress -V -T 1C -DskipTests --no-transfer-progress -Dquarkus.profile=lambda -Dlambda clean package -Paws-lambda " +
                " -pl :blogq-backend -am"
            }
          },
          'application frontend build': {
            script {
              echo "#Build Application"
              updateUiConfig()
              dir('blogq-web-ui') {
                sh "pnpm install"
                sh "pnpm run build"
              }
            }
          }
        )
      }
    }

    stage('deploy certificate') {
      steps {
        withAWS(credentials: "${env.AWS_CREDENTIALS}", region: "us-east-1") {
          script {
            echo "#Bootstrap CDK "
            sh "cdk bootstrap aws://${env.AWS_ACCOUNT_ID}/us-east-1"

            echo "#Run CDK to deploy certificate for the WebApp UI"
            sh "mvn -B --no-transfer-progress -V -T 1C clean -pl :cdk && rm -rf cdk/cdk.out || true "
            dir('cdk') {
              sh "../ci-cd/release/deploy-frontend-certificate.sh techeule-blogq-app-certificate"
            }

            archiveArtifacts artifacts: "**/cdk.out/**"

            env.UI_CERT_ARN = (
              sh(
                returnStdout: true,
                script: "./ci-cd/release/read-cert-arn.sh ./cdk/t12s-blogq-frontend-web-app-certificate.deployment.out.txt"
              ) as String
            ).replace("\n", "").trim()

            echo "env.UI_CERT_ARN=${env.UI_CERT_ARN}"

            if (("${env.UI_CERT_ARN}" as String).isBlank()) {
              sh "cat ./ci-cd/release/read-cert-arn.sh ./cdk/t12s-blogq-frontend-web-app-certificate.deployment.out.txt"
              error("Certificate for the Frontend was not created!")
            }
          }
        }
      }
    }

    stage('deploy application') {
      when { expression { env.UI_CERTIFICATE_ONLY == "false" } }
      steps {
        withAWS(credentials: "${env.AWS_CREDENTIALS}", region: "${env.REGION}") {
          script {
            echo "#Bootstrap CDK "
            sh "cdk bootstrap aws://${env.AWS_ACCOUNT_ID}/${env.REGION}"

            sedReplaceInFile("__WEB_APP_CERT_ARN__", "${env.UI_CERT_ARN}", "${env.infrastructureConfigFile}")

            archiveArtifacts artifacts: "${env.infrastructureConfigFile}"

            echo "#Run CDK to deploy the stacks: ${env.STACKS}"
            sh "mvn -B --no-transfer-progress -V -T 1C clean -pl :cdk && rm -rf cdk/cdk.out || true "
            sh "cd cdk && ../ci-cd/release/deploy-stacks-certificate.sh ${env.STACKS}"

            currentBuild.description = "Deployed '${params.STACK}' in '${env.ENV}' from '${params.GIT_BRANCH}'"
            archiveArtifacts artifacts: "**/cdk.out/**"

            sh "./ci-cd/release/cdn-invalidate-cloudfront.sh ./cdk/api-app.deployment.out.txt"
          }

        }
      }
    }

    stage('system tests: web-api') {
      when { expression { env.UI_CERTIFICATE_ONLY == "false" } }
      steps {
        script {
          if (("${env.STACKS}" as String).contains(t12sBlogQApiStack)) {
            sh "chmod +x ./ci-cd/wait_for_url.sh"
            sh "./ci-cd/wait_for_url.sh 120 'https://${env.DNS_RECORD_NAME}.${env.ROOT_DOMAIN}/q/health'"
            sh "./mvnw -V -T 1C -B --no-transfer-progress clean test-compile " +
              " failsafe:integration-test " +
              " failsafe:verify " +
              " -pl :t12s-blogq-st " +
              " -Dmaven.test.failure.ignore=true " +
              " -Dapp.protocolAndHost=https://${env.DNS_RECORD_NAME}.${env.ROOT_DOMAIN} " +
              " -Dmp.config.profile=lambda "

            junit '**/target/*-reports/*.xml'
          } else {
            echo "Skipped due (\"${params.STACK}\" as String).contains(\"${t12sBlogQApiStack}\") == false"
          }
        }
      }
    }
  }
}

private void updateUiConfig() {
  sh "echo '\n_backendRootUrl = \"https://${env.DNS_RECORD_NAME}.${env.ROOT_DOMAIN}/resources\";\n' >> blogq-web-ui/src/configuration/entity/backend-config.ts"
  sh "echo '\n_oidcKeycloakRootUrl = \"https://${env.DNS_RECORD_NAME_UI}.${env.ROOT_DOMAIN}\";\n' >> blogq-web-ui/src/configuration/entity/oidc-keycloak-config.ts"
  sh "echo '\n_rootUrl = \"https://${env.DNS_RECORD_NAME_UI}.${env.ROOT_DOMAIN}\";\n' >> blogq-web-ui/src/configuration/entity/app-config.ts"

  try {
    final def tagId = ("${params.GIT_BRANCH}" as String).replace("\"", "'").replace("\n", "").trim()
    if (!"".equalsIgnoreCase(tagId) && !"null".equalsIgnoreCase(tagId)) {
      sh "echo '\n_appVersion = \"${tagId}\"\n' >> blogq-web-ui/src/configuration/entity/app-config.ts"
    }
  } catch (final _exception) {
    sh "echo '\n_appVersion = \"\"\n' >> blogq-web-ui/src/configuration/entity/app-config.ts"
  }
}

private void sedReplaceInFile(final String key, final String value, final String filePath) {
  final def keyToReplace = key.replace('/', "\\/")
  final def valueToReplace = value.replace('/', "\\/")
  sh "sed -i -e \"s/${keyToReplace}/${valueToReplace}/g\" '${filePath}'"
}
