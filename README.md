# kube-ciserver

Based on the Jenkins official image, this CIServer container is intended for its usage inside a Kubernetes cluster. It is able to manage the host docker daemon using its own Docker client. The Docker client expects /var/lib/docker.sock to be mounted as stated in https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/. It does NOT use Docker-in-Docker.

Additionally, it can manage the Kubernetes cluster where it is deployed on via the kubectl tool. This way the access to the Kubernetes API is streamlined by using the official CLI.
