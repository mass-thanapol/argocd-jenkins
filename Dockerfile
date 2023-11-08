FROM jenkins/jenkins:2.414.3-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# docker build -t myjenkins-blueocean:2.414.3-1 .

# run
# docker run \
#   --name jenkins-blueocean \
#   --restart=on-failure \
#   --detach \
#   --network jenkins \
#   --env DOCKER_HOST=tcp://docker:2376 \
#   --env DOCKER_CERT_PATH=/certs/client \
#   --env DOCKER_TLS_VERIFY=1 \
#   --publish 8080:8080 \
#   --publish 50000:50000 \
#   --volume jenkins-data:/var/jenkins_home \
#   --volume jenkins-docker-certs:/certs/client:ro \
#   myjenkins-blueocean:2.414.3-1



# docker build -t jenkins:v1 .
# docker run -p 8080:8080 jenkins:v1

# docker run -d -p 8080:8080 -p 50000:50000 --privileged -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts-jdk17
# get login's password
# docker logs <CONTAINER_ID>
# install all default plugin

# click new item
# set Git repo
# set pipeline