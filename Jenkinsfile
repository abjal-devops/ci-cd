node {
    stage('scm checkout'){
        git 'https://github.com/abjal-devops/ci-cd.git'
    }
    stage('build') {
        home = tool name: 'maven', type: 'maven'
        sh "$home/bin/mvn clean install"
    }
    stage('build docker image') {
        sh "docker build -t abjal/test:v${BUILD_ID} ."
    }
    stage('push to docker hub') {
        withCredentials([usernamePassword(credentialsId: 'hub', passwordVariable: 'password', usernameVariable: 'username')]) {
      sh '''docker login -u $username -p $password       
         docker push abjal/test:v${BUILD_ID}'''
	  }
    }
    stage('deploy service on swarm') {
        withCredentials([sshUserPrivateKey(credentialsId: '7a46d593-b99e-4734-b881-73462b2c0d9a', keyFileVariable: 'key', passphraseVariable: '', usernameVariable: 'username')]) {
            withCredentials([usernamePassword(credentialsId: 'hub', passwordVariable: 'password', usernameVariable: 'username')]) {
      sh '''ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker login -u $username -p $password 
          ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker service ls | grep test
          if [$? == 1]
          then
          ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker service create --name test --publish 80:8080 abjal/test:v${BUILD_ID}
          else 
          ssh -o StrictHostKeyChecking=no -i $key ec2-user@13.59.55.248 sudo docker service update --image=abjal/test:v${BUILD_ID} test
          fi '''
            }
        }
   }
}
