pipeline {
    agent any
    tools { 
        maven 'maven 3.6.3' 
        jdk 'jdk8' 
    }
    environment {
    registry = "abjaldevops/test"
    registryCredential = 'Dockerhub'
    dockerImage = ''
  }
    stages {  
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = /opt/apache-maven-3.6.3/bin/"
                ''' 
            }
        }
        stage('Scm Checkout'){
	        steps {
                git 'https://github.com/abjal-devops/ci-cd.git'
            }
	    }
        stage('Build') {
		    steps {
                sh "mvn clean install"
			}
        }
        stage('Docker build'){
            steps{
              script {
               dockerImage = docker.build registry + ":$BUILD_NUMBER"
                 }
             }

        }
        stage('Deploy Image') {
             steps{
                script {
                  docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
                   }
               }
           }
        }
    }
}    
