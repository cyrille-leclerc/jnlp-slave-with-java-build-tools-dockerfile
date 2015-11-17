FROM cloudbees/java-build-tools

USER root

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/2.53/remoting-2.53.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave

RUN chmod a+rwx /home/jenkins
WORKDIR /home/jenkins
USER jenkins

ENTRYPOINT ["/opt/bin/entry_point.sh", "/usr/local/bin/jenkins-slave"]
