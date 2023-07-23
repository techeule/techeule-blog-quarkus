#!groovy

@Library('pkgv-t12slabs-shared-library') _

pipeline {

  agent { label 'ci-small || ci-multi-executors' }

  options {
    timeout(time: 120, unit: 'MINUTES')
    lock resource: "t12s-blogq-release"
  }

  tools {
    jdk 'jdk-17'
  }

  parameters {
    gitParameter(name: 'GIT_BRANCH', branchFilter: '.*', defaultValue: 'develop', type: 'PT_BRANCH', sortMode: 'DESCENDING_SMART', description: 'which git branch should be released')
  }

  stages {

    stage('Clean Up & Setup') {
      steps {
        deleteDir()
        checkout scm
        script {
          env.FROM_BRANCH = ("${params.GIT_BRANCH}" as String).replace("origin/", "")
        }
      }
    }

    stage('Check Branch Status') {
      steps {
        script {
          final def buildsToCheck = [
            "T12S-BlogQ/T12S-BlogQ-Branches/${env.FROM_BRANCH}".toString()
          ]
          echo "buildsToCheck=${buildsToCheck}"

          final List jobs = Hudson.instance.getAllItems(hudson.model.Job.class).findAll { final item ->
            // echo "item.fullName=${item.fullName.replaceAll("%2F", "/")}"
            return buildsToCheck.contains(item.fullName.replaceAll("%2F", "/"))
          }

          if (jobs.size() != buildsToCheck.size()) {
            final List jobNames = jobs.collect { it.fullName.replaceAll("%2F", "/") }
            error("Not all builds that should be checked were found. Builds missing: ${buildsToCheck.collect().minus(jobNames)}")
          }

          jobs.each { final job ->
            if (job.lastBuild.result.toString() != 'SUCCESS') {
              error("The latest build #${job.lastBuild.number} of ${job.fullName} is not successful: ${job.lastBuild.result}! Please, check and resolve manually!")
            } else {
              echo "The latest build #${job.lastBuild.number} of ${job.fullName} is successful!"
            }
          }
        }
      }
    }

    stage('Prepare') {
      steps {
        script {
          setPomVersions()
          currentBuild.description = "CURRENT_RELEASE_VERSION='${env.CURRENT_RELEASE_VERSION}'," +
            " NEXT_DEVELOPMENT_VERSION=${env.NEXT_DEVELOPMENT_VERSION}-SNAPSHOT"
        }
      }
    }

    stage('Release') {
      steps {
        script {
          sshagent(credentials: ['GITHUB_SSH']) {

            final String branchName = "releases/version-${env.CURRENT_RELEASE_VERSION}"
            echo "# Prepare Release"
            sh "git checkout -b ${branchName}"
            sh "mvn -B --no-transfer-progress -V -T 1C versions:set -DnewVersion=${env.CURRENT_RELEASE_VERSION}"
            sh "git add . && git commit -m \"Release version ${env.CURRENT_RELEASE_VERSION}\" --author=\"CI-CD T12S-PkgV <ci-cd@t12s-blogq.app>\""

            echo "# Merge Release into main and tag"
            sh "git checkout main && git pull --rebase"
            sh "git merge --ff-only ${branchName}"
            sh "git tag -a \"${env.CURRENT_RELEASE_VERSION}\" -m \"release version ${env.CURRENT_RELEASE_VERSION}\""

            echo "# Prepare next development cycle"
            sh "git checkout develop"
            sh "git merge --ff-only main"
            final String nextSnapshot = "${env.NEXT_DEVELOPMENT_VERSION}-SNAPSHOT"
            sh "mvn -B --no-transfer-progress -V -T 1C versions:set -DnewVersion=${nextSnapshot}"
            sh "git add . && git commit -m \"Start development cycle for ${nextSnapshot}\" --author=\"CI-CD T12S-PkgV <ci-cd@t12s.io>\""

            echo "# Push all changes to Git-Remote"
            sh "git branch -d ${branchName}"
            sh "git push --all && git push --tags"
          }
        }
      }
    }
  }
}

private void setPomVersions() {
  pom = readMavenPom(file: 'pom.xml')
  final def pom_version = (pom.version).toString() as String
  final version = pom_version.split("-")[0]
  final def finalVersion = getCurrentVersionAsArray(version)
  finalVersion[2] = (Integer.parseInt(finalVersion[2] + "") + 1)
  env.CURRENT_RELEASE_VERSION = "${version}"
  env.NEXT_DEVELOPMENT_VERSION = finalVersion[0] + '.' + finalVersion[1] + '.' + finalVersion[2]
}


private ArrayList<Integer> getCurrentVersionAsArray(final String version) {
  final versionParts = version.split("\\.")
  final finalVersion = [0, 0, 0]
  println "version=$version => versionParts=$versionParts (versionParts.length=${versionParts.length})"

  switch (versionParts.length) {
    case 0:
      finalVersion[0] = 0
      finalVersion[1] = 0
      finalVersion[2] = 1
      break
    case 1:
      finalVersion[0] = Integer.parseInt(versionParts[0])
      finalVersion[1] = 0
      finalVersion[2] = 0
      break
    case 2:
      finalVersion[0] = Integer.parseInt(versionParts[0])
      finalVersion[1] = Integer.parseInt(versionParts[1])
      finalVersion[2] = 0
      break
    case 3:
      finalVersion[0] = Integer.parseInt(versionParts[0])
      finalVersion[1] = Integer.parseInt(versionParts[1])
      finalVersion[2] = Integer.parseInt(versionParts[2])
      break
    default:
      throw IllegalStateException("expected version=$version has a structure like [0-9]+\\.[0-9]+\\.[0-9]+-SNAPSHOT")
  }
  println "finalVersion=$finalVersion"
  finalVersion
}
