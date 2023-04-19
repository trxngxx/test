pipeline {
    agent any

    environment {
        SERVER = 'apache'
        DEPLOY_DIR = '/var/www/html'
    }

    stages {
        stage('Clone code') {
            steps {
                git 'https://github.com/trxngxx/test'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt-get install -y apache2'
            }
        }

        stage('Deploy') {
            steps {
                sh "sudo rm -rf ${DEPLOY_DIR}/*"
                sh "sudo cp -r ${WORKSPACE}/* ${DEPLOY_DIR}/"
                sh "sudo systemctl restart ${SERVER}"
            }
        }
    }
}
