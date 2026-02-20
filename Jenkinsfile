pipeline {
  agent any

  options {
    buildDiscarder(logRotator(numToKeepStr: '60', artifactNumToKeepStr: '2'))
  }

  triggers {
    cron '@midnight'
  }

  environment {
    version = 'dev'
    branchVersion = 'master'
  }

  stages {
    stage('fetch-deps') {
      steps {
        script {
          if (env.BRANCH_NAME.startsWith('release/')) {
            version = evalReleaseVersion()
            branchVersion = version
          }

          def integrateDependencies = {
            maven cmd: "-f pom.xml clean package -Ddoc.version=${version}"
          }
          runMaven(integrateDependencies)
          withChecks('Maven Issues') {
            recordIssues tools: [mavenConsole()], qualityGates: [[threshold: 1, type: 'TOTAL']]
          }
        }
      }
    }
    stage('EN') {
      steps {
        script {
          docker.image('axonivy/build-container:read-the-docs-2').inside {
            sh "make -C /doc-build html BASEDIR='${env.WORKSPACE}' " +
               "VERSION=${version} BRANCH_VERSION=${branchVersion} "+
               "VERSION_SWITCHER=true"
          }
          sh "rm build/html/portal-guide/index.html"
          sh "mkdir -p build/doc"
          sh "mv build/html build/doc/en"

          archiveArtifacts 'build/doc/en/**/*, ' +
                          'target/resources/includes/_release-notes.md'

          withChecks('Doc Sphinx Issues') {
            recordIssues tools: [sphinxBuild()], qualityGates: [[threshold: 1, type: 'TOTAL']]
          }
          currentBuild.description = "<a href='${BUILD_URL}artifact/build/doc/en/index.html'>Doc 🇬🇧️</a>"
        }
      }
    }
    stage('JA') {
      steps {
        script {
          docker.image('axonivy/build-container:read-the-docs-2').inside {
            sh "make -C /doc-build html BASEDIR='${env.WORKSPACE}' " + 
               "VERSION=${version} BRANCH_VERSION=${branchVersion} " + 
               "GETTEXT_COMPACT=user-guide " + 
               "LOCALEDIR=\"${env.WORKSPACE}/locale\" SPHINXOPTS=\"-D language='ja'\" "+
               "VERSION_SWITCHER=true"
          }
          sh "rm build/html/portal-guide/index.html"
          sh "mkdir -p build/doc"
          sh "mv build/html build/doc/ja"

          archiveArtifacts 'build/doc/ja/**/*'

          withChecks('Doc Sphinx Issues-JA') {
            recordIssues tools: [sphinxBuild(id: 'sphinx-JA', name: 'Sphinx JA')], 
              qualityGates: [[threshold: 1, type: 'TOTAL']]
          }

          currentBuild.description += "<br/><a href='${BUILD_URL}artifact/build/doc/ja/index.html'>Doc 🇯🇵️</a>"
        }
      }
    }
    stage('publish') {
      when {
        expression { isReleasingBranch() }
      }
      steps {
        script {
          def releaseVersion = evalReleaseVersion()
          def deployer = {
            def host = 'axonivya@217.26.51.247'
            def homeDir = '/home/axonivya'
            def dir = "$homeDir/data/ivy-doc"
            def destFolder = "$dir/doc-$releaseVersion-" + new Date().format('yyyy-MM-dd_HH-mm-ss-SSS')

            echo "Upload doc to $host:$destFolder"
            sh "ssh $host mkdir -p $destFolder"

            echo 'Upload documentation'
            sh "rsync -r build/doc/ $host:$destFolder"

            sh "ssh $host ln -fns $destFolder $homeDir/data/doc/$releaseVersion"
          }
          runSSH(deployer)
        }
      }
    }
  }
}

def evalReleaseVersion() {
  def version = evaluateMavenProperty('project.version')
  def matcher = (version =~ /(\d+.\d+).\d+(\-SNAPSHOT)?/)
  if (matcher.matches()) {
    return matcher.group(1)  // minor version, e.g. 9.1
  } 
  throw new Exception("Failed to evaluate release version from: $version")
}

def evaluateMavenProperty(def propertyName) {
  def cmd = { mavenPropertyEvaluate(propertyName) }
  runMaven(cmd)
}

def mavenPropertyEvaluate(def propertyName) {
  def cmd = "mvn help:evaluate -Dexpression=$propertyName -q -DforceStdout"
  def value = sh (script: cmd, returnStdout: true)
  echo "value of maven property $propertyName is $value"
  if (value == "null object or invalid expression") {
    throw new Exception("could not evaluate maven property $propertyName");
  }
  return value
}

def runMaven(command) {
  docker.build('maven-build', '-f Dockerfile.maven .').inside {
    command.call()
  }
}

def runSSH(command) {
  docker.image('axonivy/build-container:ssh-client-1').inside {
    sshagent(['zugprojenkins-ssh']) {
      command.call()
    }
  }
}
