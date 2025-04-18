pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/Arghya-Dutta1/online-market-for-local-vendors.git'
        PROJECT_NAME = 'online-market-for-local-vendors'
    }

    stages {
        // stage('Clean Workspace') {
        //     steps {
        //         cleanWs()
        //     }
        // }

        stage('Clone Repository') {
            steps {
                sh 'git clone ${REPO_URL}'
            }
        }

        stage('Build Docker Images') {
            steps {
                dir("${PROJECT_NAME}") {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Start Containers') {
            steps {
                dir("${PROJECT_NAME}") {
                    sh 'docker-compose up -d'
                }
            }
        }

        stage('Verify Running Containers') {
            steps {
                sh 'docker ps -a'
            }
        }
    }

    post {
        success {
            mail to: 'aryadutta004@gmail.com',
                 subject: "✅ Build Success - #${env.BUILD_NUMBER}",
                 body: "Diabetes Prediction pipeline ran successfully!"
        }
        failure {
            mail to: 'aryadutta004@gmail.com',
                 subject: "❌ Build Failed - #${env.BUILD_NUMBER}",
                 body: "Pipeline failed. Please check Jenkins logs."
        }
    }
}
