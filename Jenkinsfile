node {
 try  {
     
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
}

} catch (err) {
  notify("Error ${err}")
  currentBuild.result = 'FAILURE'
}
}

