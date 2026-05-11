pipeline {
    agent any

    environment {
        DEV_IMAGE = "yourdockerhub/dev:latest"
        PROD_IMAGE = "yourdockerhub/prod:latest"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'dev',
                url: 'https://github.com/yourrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DEV_IMAGE .'
            }
        }

        stage('Push Dev Image') {
            when {
                branch 'dev'
            }
            steps {
                withDockerRegistry([], 'dockerhub-creds') {
                    sh 'docker push $DEV_IMAGE'
                }
            }
        }

        stage('Push Prod Image') {
            when {
                branch 'master'
            }
            steps {
                withDockerRegistry([], 'dockerhub-creds') {
                    sh 'docker tag $DEV_IMAGE $PROD_IMAGE'
                    sh 'docker push $PROD_IMAGE'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
