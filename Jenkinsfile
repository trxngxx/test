pipeline {
   agent none
   stages {
      stage('Build Image') {
	     when {
             branch 'main'
            }
         agent {
             node {
                  label 'test'
                  customWorkspace '/var/jenkins_home/'
                }
            }
         steps {
               sh "cd /var/jenkins_home/repo1 && docker build nginx_v1 ."
           }
       }
      stage('Deploy Image') {
        when {
             branch 'main'
            }
        agent {
              node {
                  label 'test'
                  customWorkspace '/var/jenkins_home/'
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
