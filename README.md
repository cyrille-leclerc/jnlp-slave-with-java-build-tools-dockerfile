# Description

Extends [cloudbees/java-build-tools](https://hub.docker.com/r/cloudbees/java-build-tools/) so it can be used as a Jenkins JLNP slave, for use with Jenkins Cloud plugins.

See [README](https://hub.docker.com/r/cloudbees/java-build-tools/) for details on available tools.

# Supported tags and respective `Dockerfile` links

-   [`latest` (*latest/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/master/Dockerfile)
-   [`0.0.5.1` (*0.0.5.1/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.5.1/Dockerfile)
-   [`0.0.5` (*0.0.5/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.5/Dockerfile)
-   [`0.0.2` (*0.0.2/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.2/Dockerfile)

# How to use this Docker image

This Docker image is intended to be used in conjunction with a Docker container orchestration service such as
-   Kubernetes (see [Jenkins Kubernetes Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Kubernetes+Plugin))
-   Mesos (see [Jenkins Mesos Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Mesos+Plugin))
-   Amazon EC2 Container Service

It can also be used "static" Jenkins slave connected to a Jenkins master declaring a JNLP slave but it would require to manually launch the Docker container.

# Running

To run a Docker container

    docker run cloudbees/jnlp-slave-with-java-build-tools -url http://jenkins-server:port <secret> <slave name>

optional environment variables:

* `JENKINS_URL`: url for the Jenkins server, can be used as a replacement to `-url` option, or to set alternate jenkins URL
* `JENKINS_TUNNEL`: (`HOST:PORT`) connect to this slave host and port instead of Jenkins server, assuming this one do route TCP traffic to Jenkins master. Useful when when Jenkins runs behind a load balancer, reverse proxy, etc.


# Docker image details

-   OS: Ubuntu 15.04
-   Build tools installed on [cloudbees/java-build-tools](https://hub.docker.com/r/cloudbees/java-build-tools/).
-   Jenkins slave.jar (aka remoting.jar)
    - `0.0.5.1`: 2.53.2
    - `0.0.5`: 2.53

# Release Notes

See the [GitHub release notes](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/releases).

# About this repository

This repository is available on [github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile), and the automated build is on the [Docker Hub](https://hub.docker.com/r/cloudbees/jnlp-slave-with-java-build-tools/).

## Supported Docker versions

This image has been tested with Docker version 1.8.1.

# User Feedback

## Issues

If you have any problems with or questions about this image, please submit a [GitHub issue](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/issues).

## Contributing

If you have a contribution for this repository, please send a pull request.

If you want to contribute to Jenkins CI, see the [Contributing to Jenkins](https://wiki.jenkins-ci.org/display/JENKINS/contributing).

# License

The cloudbees/java-build-tools image is licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0), and this repository is too:

```
Copyright 2015 CloudBees, Inc


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
