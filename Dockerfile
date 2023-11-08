FROM jenkins/jenkins:lts-jdk17

ENV JENKINS_USER admin
ENV JENKINS_PASS password

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

RUN jenkins-plugin-cli \
    --plugins \
    git \
    github \
    docker \
    credentials

USER jenkins

EXPOSE 8080

# docker build -t jenkins:v1 .
# docker run -p 8080:8080 jenkins:v1