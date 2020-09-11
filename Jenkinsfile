node {
    stage('scm checkout'){
        git 'https://github.com/abjal-devops/ci-cd.git'
    }
    stage('build') {
        home = tool name: 'maven', type: 'maven'
        sh "$home/bin/mvn clean install"
    }
    stage('build docker image') {
        sh 'docker build -t abjal/test:v${BUILD_ID} .'
    }
    stage('push to docker hub') {
        withCredentials([usernameColonPassword(credentialsId: '0bb80b87-e67d-4753-a65b-77e5bdaa967f', variable: 'password')]) {
    sh "docker login -u abjal -p $password" https://hub.docker.com/v2
        }       
      sh 'docker push abjal/test:v${BUILD_ID}'
    }
}
     // docker.withRegistry('https://registry.example.com', 'credentials-id') {

      //  def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
    //    customImage.push()
  //  }
//} 
   // stage('run container'){
     //   withCredentials([sshUserPrivateKey(credentialsId: '1dd31cd0-240d-4f40-a7a8-9d5839603935', keyFileVariable: 'pass', passphraseVariable: '', usernameVariable: 'username')]) {
       //     sh "ssh -i ${pass} ec2-user@10.0.1.228 'docker run -it -d -p 8080:8080 --name app abjal/app:2.0'"
         //  }
    //}
//}
