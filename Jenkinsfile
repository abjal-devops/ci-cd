pipeline {
    agent any
    environment { 
        home = "/opt/apache-maven-3.6.2/"
    }
    stages {        
        stage('scm checkout'){
	        steps {
                git 'https://github.com/abjal-devops/ci-cd.git'
            }
	    }
        stage('build') {
		    steps {
                sh "$home/bin/mvn clean install"
			}
        }
        stage('build docker image') {
		     steps {
                 sh "docker build -t abjal/test:v${BUILD_ID} ."
			}
       }
        stage('push to docker hub') {
		    steps {
                withCredentials([usernamePassword(credentialsId: 'hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh '''docker login -u $username -p $password       
                docker push abjal/test:v${BUILD_ID}'''
		    }
	      }
        }
        stage('deploy service on swarm') {
		    steps {
                script {
                    withCredentials([sshUserPrivateKey(credentialsId: 'key', keyFileVariable: '', passphraseVariable: '', usernameVariable: '')]) {
                    withCredentials([usernamePassword(credentialsId: 'hub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh "ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker login -u $username -p $password"
                    try {
                        sh "ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker service update --image=abjal/test:v${BUILD_ID} test"
                    } catch (err) {
                        sh "ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker service create --name test --publish 80:8080 abjal/test:v${BUILD_ID}"
                    }
                }     
                    }
                }
			}
		}
    }
}
