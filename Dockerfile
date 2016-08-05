FROM jenkins

USER root

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl && mv ./kubectl /usr/bin/ && chmod +x /usr/bin/kubectl

RUN apt-get update && apt-get -y install apt-transport-https ca-certificates && apt-key adv --keyserver-options http-proxy=http://10.121.8.100:8080 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D 

RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" | tee /etc/apt/sources.list.d/docker.list && apt-get update
RUN apt-get -y install docker-engine=1.10.3-0~jessie

RUN apt-get -y install sudo && adduser jenkins sudo

COPY sudoers /etc
RUN chmod 440 /etc/sudoers

USER jenkins
