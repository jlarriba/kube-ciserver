# General Description

Based on the Jenkins official image, this CIServer container is intended for its usage inside a Kubernetes cluster. It is able to manage the host docker daemon using its own Docker client. The Docker client expects /var/run/docker.sock to be mounted as stated in https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/. It does NOT use Docker-in-Docker.

Additionally, it can manage the Kubernetes cluster where it is deployed on via the kubectl tool. This way the access to the Kubernetes API is streamlined by using the official CLI.

# Run
This container is intended to run inside a Kubernetes cluster, so the Kubectl CLI knows how to authenticate itself without further configuration, but the image can be extended adding authentication for external clusters. In the [GitHub repository](https://github.com/jlarriba/kube-ciserver), deployment scripts for Kubernetes can be found.

If you want to run outside from a cluster, you need to expose port 8080 to access Jenkins console and mount the /var/run/docker.sock volume so Docker client can be used:
```
docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jlarriba/kube-ciserver
```
