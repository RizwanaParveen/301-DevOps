node {
 try  {
 notify('DevOps 301 Pipeline Started') 

     
  stage('Git-Checkout') {
   git 'https://github.com/RizwanaParveen/301-DevOps.git'
  }
    
 def project_path="01-Jenkins/Code/petclinic"
 dir(project_path) {
    
  stage('Maven-Clean') {
   sh label: '', script: 'mvn clean'
  }
    
 stage('Maven-Compile') {
   sh label: '', script: 'mvn compile'
  }
  
   stage('Maven-Test') {
   sh label: '', script: 'mvn test'
  }
  stage('SonarQube') {
   sh label: '', script: 'mvn sonar:sonar'
  }
   stage('Archive-Artifacts') {
   archiveArtifacts 'target/*.war'
  }

  stage('Docker-Deployment') {
   sh label: '', script: 'docker-compose up -d --build'
   sh label: '', script: 'docker-compose ps'
   notify('Deployed To QA.')

  } }
  notify('Job Completed')   
} catch (err) {
  notify("Error ${err}")
  currentBuild.result = 'FAILURE'
}
}



def notify(status){
    emailext (
	to: "rizwanaparveen64@gmail.com",
	subject: "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
	 body: """<p>${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
	<p>Check console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a></p>""",
		)
	}
