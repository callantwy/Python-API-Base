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
    }
}
