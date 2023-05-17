pipeline {
    agent any
        environment {
        SERVER = 'ngo1-virtual-machine'
        DEPLOY_DIR = '/var/www/html'
    }
    
    stages {
        stage('Clone code ') {
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
                sh "sudo rm -rf /var/www/html/*"
                sh "sudo cp -r /var/www/html/* /var/www/html/"
                sh "sudo systemctl restart ngo1-virtual-machine/var/www/html"
            }
        }
    }
}
