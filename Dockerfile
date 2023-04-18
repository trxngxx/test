# Base image
FROM jenkins/jenkins:latest

# Switch to root user
USER root

# Install packages needed for SSH
RUN apt-get update && apt-get install -y ssh sshpass

# Copy Jenkinsfile to the image
COPY Jenkinsfile /usr/share/jenkins/ref/Jenkinsfile

# Set the permissions for Jenkins to execute the Jenkinsfile
RUN chown -R jenkins:jenkins /usr/share/jenkins/ref

# Switch back to the Jenkins user
USER jenkins
