FROM jenkins

USER root

RUN apt-get update && apt-get -y upgrade

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl && mv ./kubectl /usr/bin/ && chmod +x /usr/bin/kubectl

RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 && mv ./docker-1.10.3 /usr/bin/docker && chmod +x /usr/bin/docker

RUN apt-get -y install sudo && adduser jenkins sudo

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
