pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/Arghya-Dutta1/online-market-for-local-vendors.git'
        PROJECT_NAME = 'online-market-for-local-vendors'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repository') {
            steps {
                bat "git clone $REPO_URL"
            }
        }

        stage('Build Docker Images') {
            steps {
                dir("${PROJECT_NAME}") {
                    bat 'docker-compose build'
                }
            }
        }

        stage('Start Containers') {
            steps {
                dir("${PROJECT_NAME}") {
                    bat 'docker-compose up -d'
                }
            }
        }

        stage('Verify Running Containers') {
            steps {
                bat 'docker ps -a'
            }
        }
    }

    post {
        success {
            mail to: 'aryadutta004@gmail.com',
                 subject: "✅ Build Success - #${env.BUILD_NUMBER}",
                 body: """
    🎉 Your Jenkins pipeline ran successfully!

    📄 Job Name: ${env.JOB_NAME}
    🔢 Build Number: ${env.BUILD_NUMBER}
    🌿 Branch: ${env.GIT_BRANCH}
    🔗 Build URL: ${env.BUILD_URL}
    🕒 Timestamp: ${new Date()}
    ⏱ Duration: ${currentBuild.durationString}

    ✅ Status: SUCCESS
    """
        }
        failure {
            mail to: 'aryadutta004@gmail.com',
                 subject: "❌ Build Failed - #${env.BUILD_NUMBER}",
                 body: """
    ⚠️ Pipeline build failed.

    📄 Job Name: ${env.JOB_NAME}
    🔢 Build Number: ${env.BUILD_NUMBER}
    🌿 Branch: ${env.GIT_BRANCH}
    🔗 Build URL: ${env.BUILD_URL}
    🕒 Timestamp: ${new Date()}
    ⏱ Duration: ${currentBuild.durationString}

    ❌ Status: FAILURE

    Please check the Jenkins console output for more details.
    """
        }
    }
}
