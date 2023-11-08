FROM jenkins/jenkins:lts-jdk17

ENV JENKINS_USER admin
ENV JENKINS_PASS password

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER jenkins

EXPOSE 8080

# docker build -t jenkins:v1 .
# docker run -p 8080:8080 jenkins:v1