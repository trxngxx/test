pipeline {
    agent none
        environment {
        SSH_USER = 'ngo1'
        SSH_PASSWORD = 'ngo'
        SSH_HOST = '192.168.81.136'
        SSH_PORT = '22'
        DEPLOY_DIR = '/var/www/html'
    }
    stages {
        stage('Clone code') {
              when {
              branch 'main'
             }
            steps {
                git 'https://github.com/trxngxx/test.git'
            }
        }

        stage('Install dependencies') {
              when {
              branch 'main'
             }
            steps {
                sh 'sudo apt-get update'
                sh 'sudo apt-get install -y nginx'
            }
        }

        stage('Deploy') {
              when {
              branch 'main'
             }
            steps {
                sshagent(credentials: ['ssh-credentials-id']) {
                    sh "sshpass -p ${SSH_PASSWORD} ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} -p ${SSH_PORT} 'sudo rm -rf ${DEPLOY_DIR}/*'"
                    sh "sshpass -p ${SSH_PASSWORD} scp -o StrictHostKeyChecking=no -r ${WORKSPACE}/* ${SSH_USER}@${SSH_HOST}:${DEPLOY_DIR}/"
                    sh "sshpass -p ${SSH_PASSWORD} ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} -p ${SSH_PORT} 'sudo systemctl restart nginx'"
                }
            }
        }
    }
}
