FROM registry.access.redhat.com/ubi8/openjdk-8:latest

USER root

RUN dnf install -y git wget

RUN java -version

RUN mkdir -p /opt/ant/ && wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -P /opt/ant

RUN tar -xvzf /opt/ant/apache-ant-1.9.8-bin.tar.gz -C /opt/ant/

RUN rm -f /opt/ant/apache-ant-1.9.8-bin.tar.gz

RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-ant-task/2.3/sonar-ant-task-2.3.jar -P /opt/ant/apache-ant-1.9.8/lib/

ENV ANT_HOME=/opt/ant/apache-ant-1.9.8

ENV ANT_OPTS="-Xms256M -Xmx512M"

ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"

RUN git --version

RUN ant -version
