pipeline {
   agent none
   stages {
      stage('Build Image') {
	     when {
             branch 'main'
            }
         agent {
             node {
                  label 'dev-aws'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }
         steps {
               sh "cd /home/ubuntu/jenkins/multi-branch/repo1 && docker build nginx_v1 ."
           }
       }
      stage('Deploy Image') {
        when {
             branch 'main'
            }
        agent {
              node {
                  label 'dev-aws'
                  customWorkspace '/home/ubuntu/jenkins/multi-branch/'
                }
            }
        steps {
              sh """
              echo "Deploying Code"
              """
          }
      }
   }
}