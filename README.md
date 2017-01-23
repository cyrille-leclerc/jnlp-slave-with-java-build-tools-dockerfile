# Description

Extends [cloudbees/java-build-tools](https://hub.docker.com/r/cloudbees/java-build-tools/) so it can be used as a Jenkins JLNP slave, for use with Jenkins Cloud plugins.

See [README](https://hub.docker.com/r/cloudbees/java-build-tools/) for details on available tools.

# Supported tags and respective `Dockerfile` links

-   [`latest` (*latest/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/master/Dockerfile)
-   [`2.0.0` (*2.0.0/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/2.0.0/Dockerfile)
-   [`1.0.1` (*1.0.1/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/1.0.1/Dockerfile)
-   [`1.0.0` (*1.0.0/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/1.0.0/Dockerfile)
-   [`0.0.5.1` (*0.0.5.1/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.5.1/Dockerfile)
-   [`0.0.5` (*0.0.5/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.5/Dockerfile)
-   [`0.0.2` (*0.0.2/Dockerfile*)](https://github.com/cloudbees/jnlp-slave-with-java-build-tools-dockerfile/blob/0.0.2/Dockerfile)

# How to use this Docker image

This Docker image is intended to be used in conjunction with a Docker container orchestration service such as
-   Kubernetes (see [Jenkins Kubernetes Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Kubernetes+Plugin))
-   Mesos (see [Jenkins Mesos Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Mesos+Plugin))
-   Amazon EC2 Container Service

It can also be used "static" Jenkins slave connected to a Jenkins master declaring a JNLP slave but it would require to manually launch the Docker container.

## Java

Sample with the Jenkins [Pipeline Maven Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Maven+Plugin).

```
node ("jnlp-slave-with-java-build-tools") { // provided by the Kubernetes/Mesos/Amazon ECS Plugin

    git "https://github.com/cloudbees-community/game-of-life"
    withMaven(mavenSettingsConfig:'my-maven-settings') {
       sh "mvn clean deploy"
    }
}
```

## Selenium

The docker image enables Selenium tests bundling Firefox and starting selenium-server-standalone (listening on the default port 4444).

### Selenium Sample with Java

```
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

WebDriver webDriver = new RemoteWebDriver(DesiredCapabilities.firefox());
webDriver.get("http://www.python.org");
webDriver.getTitle();
```

### Selenium Sample with Python

```
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

driver = webdriver.Remote(
   command_executor='http://127.0.0.1:4444/wd/hub',
   desired_capabilities=DesiredCapabilities.FIREFOX)

driver.get('http://python.org')
```

# Running

To run a Docker container

    docker run cloudbees/jnlp-slave-with-java-build-tools -url http://jenkins-server:port <secret> <slave name>

optional environment variables:

* `JENKINS_URL`: url for the Jenkins server, can be used as a replacement to `-url` option, or to set alternate jenkins URL
* `JENKINS_TUNNEL`: (`HOST:PORT`) connect to this slave host and port instead of Jenkins server, assuming this one do route TCP traffic to Jenkins master. Useful when when Jenkins runs behind a load balancer, reverse proxy, etc.

# Docker image details

## Version latest

-   OS: Ubuntu 16.04
-   Common tools: openssh-client, unzip, wget, curl, git
-   AWS CLI: aws-cli/1.11.41
-   Azure CLI: 0.10.8
-   Bower: 1.8.0
-   Cloud Foundry CLI (latest) at `/usr/local/bin/cf`: 6.23.1
-   Firefox at `/usr/bin/firefox`: 50.1.0
-   Firefox Geckodriver at `/usr/bin/geckodriver`: v0.13.0
-   gcc (latest): 5.4.0
-   Grunt CLI: 1.2.0
-   Gulp: 3.9.1
-   Java: OpenJDK 8 (latest): 1.8.0_111
-   JMeter (3.1) located in `/opt/jmeter/`
-   Kubernetes CLI at `/usr/local/bin/kubectl`: 1.5.2
-   Make (latest): 4.1
-   Maven located in `/usr/share/maven/`: 3.3.9
-   MySQL Client: 5.7.17
-   Node.js at `/usr/bin/nodejs`: 6.9.4
-   Npm at `/usr/bin/npm`: 3.10.10
-   Open Shift V3 CLI at `/usr/local/bin/oc`: 1.3.0
-   Python/2.7.12
-   Selenium at `/opt/selenium/selenium-server-standalone.jar`: 2.53
-   XVFB: 2:1.18.4

-   Jenkins slave.jar (aka remoting.jar) at `/usr/share/jenkins/slave.jar`: 3.4

## Version 2.0.0

-   OS: Ubuntu 16.04
-   Common tools: openssh-client, unzip, wget, curl, git
-   AWS CLI: aws-cli/1.11.41
-   Azure CLI: 0.10.8
-   Bower: 1.8.0
-   Cloud Foundry CLI (latest) at `/usr/local/bin/cf`: 6.23.1
-   Firefox at `/usr/bin/firefox`: 50.1.0
-   Firefox Geckodriver at `/usr/bin/geckodriver`: v0.13.0
-   gcc (latest): 5.4.0
-   Grunt CLI: 1.2.0
-   Gulp: 3.9.1
-   Java: OpenJDK 8 (latest): 1.8.0_111
-   JMeter (3.1) located in `/opt/jmeter/`
-   Kubernetes CLI at `/usr/local/bin/kubectl`: 1.5.2
-   Make (latest): 4.1
-   Maven located in `/usr/share/maven/`: 3.3.9
-   MySQL Client: 5.7.17
-   Node.js at `/usr/bin/nodejs`: 6.9.4
-   Npm at `/usr/bin/npm`: 3.10.10
-   Open Shift V3 CLI at `/usr/local/bin/oc`: 1.3.0
-   Python/2.7.12
-   Selenium at `/opt/selenium/selenium-server-standalone.jar`: 2.53
-   XVFB: 2:1.18.4

-   Jenkins slave.jar (aka remoting.jar): 3.4


## Version 1.0.1

-   OS: Ubuntu 15.04
-   Build tools installed on [cloudbees/java-build-tools](https://hub.docker.com/r/cloudbees/java-build-tools/).
-   Jenkins slave.jar (aka remoting.jar)
    - `1.0.1`: 2.62.4
    - `1.0.0`: 2.59
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
