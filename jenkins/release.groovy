



def buildJavadoc() {
  def buildJavadoc = {
    maven cmd: 'clean verify -f maven/modules/javadoc/pom.xml'
  }
  runMaven(buildJavadoc)
  archiveArtifacts 'javadoc/public-api/target/*.jar'
  archiveArtifacts 'javadoc/public-api/target/reports/apidocs/**/*'
  archiveArtifacts 'javadoc/taglet/target/*.jar'
  junit skipPublishingChecks: true,
        testDataPublishers: [[$class: 'StabilityTestDataPublisher']],
        testResults: '**/target/surefire-reports/**/*.xml'
  recordIssues skipPublishingChecks: true, tools: [java()], qualityGates: [[threshold: 1, type: 'TOTAL']]
  recordIssues skipPublishingChecks: true, tools: [javaDoc()], qualityGates: [[threshold: 1, type: 'TOTAL']], filters: [includeFile('.*\\.java'), excludePackage('ch.ivyteam.doclet')]
}

def buildDoc(def version, def branchVersion) {
  def integrateDependencies = {
    maven cmd: "-f pom.xml clean package -Ddoc.version=${version}" 
  }
  runMaven(integrateDependencies)

  sh "./substitute.sh ${version}"

  docker.image('axonivy/build-container:read-the-docs-2').inside {
    sh "make -C /doc-build html BASEDIR='${env.WORKSPACE}' VERSION=${version} BRANCH_VERSION=${branchVersion}"  
  }
  sh "rm build/html/portal-guide/index.html"

  // def generateSystemDbSchemaDoc = {
  //   maven cmd: "-f development/db-generator/db-meta-plugin clean install"
  //   maven cmd: "-f db-schema/pom.xml clean package"
  // }
  //runMaven(generateSystemDbSchemaDoc)

  archiveArtifacts 'build/html/**/*, ' +
                   'target/resources/includes/_release-notes.md'

  withChecks('Doc Sphinx Issues') {
    recordIssues tools: [sphinxBuild()], qualityGates: [[threshold: 1, type: 'TOTAL']]
  }
}

def generateOpenApiJson(def version) {
  def generateOpenApiJsonMvn = {
    maven cmd: "-f doc/openapi/pom.xml clean verify -DreleaseVersion=${version}"
  }
  runMaven(generateOpenApiJsonMvn)
}

def archiveProductArtifacts() {
    archiveArtifacts 'workspace/*.product/target/products/*.zip, ' +
                     'workspace/*.product/target/products/*.pkg, ' + 
                     'workspace/*.product/target/AxonIvyRepository*.zip, ' +
                     'checksums.sha256'
}

def deployProductArtifacts(def symlinkName, def folderName) {
  def productArtifactsDeployer = {
    def host = 'axonivya@217.26.51.247'
    def homeDir = '/home/axonivya'
    def destFolder = "$homeDir/data/$folderName"
    def downloadsFolder = "$destFolder/downloads"

    echo "Upload artifacts to $host:$destFolder"
    sh "ssh $host mkdir $destFolder $downloadsFolder"

    echo "Upload product artifacts"
    sh 'scp build/sbom/*.json checksums.sha256 workspace/*.product/target/products/*.zip ' + "$host:$downloadsFolder"

    def date = new Date().format("dd.MM.yyyy")
    sh "ssh $host 'echo releaseDate = $date > $destFolder/release.ready'"
    sh "ssh $host ln -fns $destFolder $homeDir/data/ivy-releases/$symlinkName"
  }
  runSSH(productArtifactsDeployer)
}

def checkAlreadyDeployed(def folderName) {
  def alreadyDeployedChecker = {
    def host = 'axonivya@217.26.51.247'
    def destFolder = "/home/axonivya/data/$folderName"
        
    def cmd = "if ssh $host '[ -d $destFolder ]'; then echo 'yes'; else echo 'no'; fi"
    def value = sh (script: cmd, returnStdout: true)
    if (value == 'yes') {
      throw new Exception("directory $host:$destFolder already exist. delete first everywhere!")
    }
  }
  runSSH(alreadyDeployedChecker)
}

def addGitReleaseTags(def branch, def tag) {
  build job: 'github-repo-manager_tag-git-repos/master', 
    parameters: [
      booleanParam(name: 'dryRun', value: false),
      string(name: 'branch', value: branch),
      string(name: 'tag', value: tag)
    ],
    wait: false
}

def deployP2Repository(def folderName) {
  def p2RepoDeployer = {
    def host = 'axonivya@p2.ivyteam.ch'
    def destFolder = "/home/axonivya/data/p2/$folderName"

    echo "Upload p2 repository to $host:$destFolder"
    sh "ssh $host mkdir -p $destFolder"
    sh "rsync -r workspace/ch.ivyteam.ivy.designer.product/target/repository/ $host:$destFolder"
    sh "ssh $host touch $destFolder/p2.ready"
  }
  runSSH(p2RepoDeployer)
}

def evaluateMavenProperty(def propertyName) {
  def cmd = { mavenPropertyEvaluate(propertyName) }
  runMaven(cmd)
}

def mavenPropertyEvaluate(def propertyName) {
  def cmd = "mvn -f maven/config/pom.xml help:evaluate -Dexpression=$propertyName -q -DforceStdout"
  def value = sh (script: cmd, returnStdout: true)
  echo "value of maven property $propertyName is $value"
  if (value == "null object or invalid expression") {
    throw new Exception("could not evaluate maven property $propertyName");
  }
  return value
}

def triggerDockerImageBuild(def version, boolean triggerDockerScout = true) {
  build job: 'docker-image/master', parameters: [string(name: 'version', value: "${version}"), booleanParam(name: 'triggerDockerScout', value: triggerDockerScout)]
}

def triggerChangelogBuild() {
  def branchName = "${BRANCH_NAME}".replace("/", "%252F")
  
  build job: 'core_doc-update-release-notes/'+"$branchName", 
    parameters: [
      booleanParam(name: 'dryRun', value: false)
    ], 
    wait: false
}

def triggerOpenVsCodeServerDockerImageBuild(def dockerImageTag) {
  build job: 'openvscode-server_docker-image/master',
    parameters: [
      string(name: 'dockerImageTag', value: dockerImageTag),
      booleanParam(name: 'dockerhub', value: true)
    ]
}

def triggerUpdateVersionBuild() {
  def releaseV=evaluateMavenProperty "ivy-release-version"
  def serviceV=evaluateMavenProperty "ivy-service-version"
  int service=serviceV as int
  int newService=service + 1
  def next="${releaseV}.${newService}-SNAPSHOT"

  echo "triggering build to raise version in all repos to ${next}"
  build job: 'github-repo-manager_raise-version/master', 
    parameters: [
      string(name: 'newVersion', value: "${next}"),
      string(name: 'branch', value: "${BRANCH_NAME}"),
      booleanParam(name: 'dryRun', value: false)
    ],
    wait: false
}

def announceRelease(releaseVersion, isLTS) {
  def flarumTrain = isLTS ? "LTS" : "LE"
  def postTitle = "Axon Ivy ${releaseVersion} - ${flarumTrain}"
  def releaseNotes="[release-notes-${releaseVersion}](https://dev.axonivy.com/doc/${releaseVersion}/release-notes)"
  def download="[${releaseVersion}](https://developer.axonivy.com/download/${releaseVersion})"
  def postContent = "We released Axon Ivy ${download}."+'\\n\\n'+
    "See all changes in the ${releaseNotes}"
  withCredentials([usernamePassword(credentialsId: 'ivy-announce.flarum', passwordVariable: 'flPass', usernameVariable: 'flUser')]) {
    sh "export flUser='${flUser}' && export flPass='${flPass}' && " + 
       "export postTitle='${postTitle}' && export postContent='${postContent}' && " +
       './build/release/official/flarum.sh'
  }
}

def runMaven(command) {
  docker.build('maven-build', '-f jenkins/Dockerfile .').inside {
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

def cleanProductArtifacts() {
  sh 'rm -rf workspace/*.product/target/products/*.zip ' +
                    'workspace/*.product/target/AxonIvyRepository*.zip '
}

def sha256sum()
{  
    sh 'sha256sum  workspace/*.product/target/products/*.zip ' +
                'workspace/*.product/target/AxonIvyRepository*.zip ' +
                "| sed 's, .*/, ,'" +
                '> checksums.sha256'
}

return this
