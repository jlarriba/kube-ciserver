FROM jenkins

USER root

RUN groupadd docker && gpasswd -a jenkins docker

RUN apt-get update && apt-get -y upgrade

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.4/bin/linux/amd64/kubectl && mv ./kubectl /usr/bin/ && chmod +x /usr/bin/kubectl

RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 && mv ./docker-1.10.3 /usr/bin/docker && chmod +x /usr/bin/docker

RUN apt-get -y install sudo && adduser jenkins sudo

RUN cd /opt && curl -O http://ftp.cixug.es/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && tar -xvzf apache-maven-3.3.9-bin.tar.gz -C /opt

RUN apt-get -y install dnsutils

RUN ["/bin/bash", "-c", "curl -s get.sdkman.io | bash && source /root/.sdkman/bin/sdkman-init.sh && https_proxy=http://10.121.8.100:8080 sdk install groovy"]

ENV PATH $PATH:/opt/apache-maven-3.3.9/bin

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
