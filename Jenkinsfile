pipeline {
    agent any
    stages {
        stage('Cleanup and Build Image') {
            steps {
                sh "sh build.sh"
            }
        }
        stage('Modify Application and Run Container') {
            steps {
                sh "sh run.sh"
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh """
                    echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin
                    docker tag lbg:latest yourusername/lbg:latest
                    docker push yourusername/lbg:latest
                    """
                }
            }
        }
    }
}

