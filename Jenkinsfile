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
  
   stage('Maven-Package') {
   sh label: '', script: 'mvn package'
  }
  
   stage('Archive-Artifacts') {
       
                withCredentials([usernamePassword(credentialsId: 'Jfrog', passwordVariable: 'password', usernameVariable: 'user')]) {
     sh 'curl -u admin:$password -T target/*.war http://aaorw62988dns.eastus2.cloudapp.azure.com:8081/artifactory/generic-local/${JOB_NAME}-${BUILD_ID}'
}}
  stage('Docker-Stage-Deployment') {
   sh label: '', script: 'docker-compose up -d --build'
   sh label: '', script: 'docker-compose ps'
   sh label: 'Docker', script: 'cp -rf target/*.war ../../../04-Terraform/03-Ansible-Deploy/ansible/04-Tomcat/templates/'
   notify('Deployed To staging.')

  }
 } 
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
