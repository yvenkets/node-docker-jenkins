pipeline {
    agent {label "doc"}
    environment {
    DOCKERHUB_CREDENTIALS = credentials('venket-docker-hub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/yvenkets/node-docker-jenkins.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t 589589/shivamnode:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push 589589/shivamnode:$BUILD_NUMBER'
            }
        }
         stage('delete old container') {
            steps{
                sh 'docker rm $(docker stop $(docker ps -a -q --filter expose=8080/tcp))'
            }
        }
        stage('run container') {
            steps{
                sh 'docker run -d -p 8080:8080 589589/shivamnode:$BUILD_NUMBER'
            }
        }
        
}
post {
        always {
            sh 'docker logout'
        }
    }
}
