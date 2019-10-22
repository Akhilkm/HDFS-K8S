# Base image UBUNTU-16.04

FROM ubuntu:16.04

MAINTAINER DevOps <akhilu011@gmail.com>

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN apt-get update -y \
    && apt-get install -y openjdk-8-jdk wget openssh-server net-tools curl vim

# RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

# Set environment veriables
ENV HADOOP_VERSION 3.2.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_HOME /opt/hadoop
ENV PATH ${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root

# Create hadoop User
RUN groupadd -r hadoop \
    && useradd -rm -s /bin/bash -g hadoop hadoop 

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /opt/hadoop.tar.gz 

RUN cd /opt && tar -xvf /opt/hadoop.tar.gz -C /opt \
    && mv hadoop-$HADOOP_VERSION hadoop \
    && rm /opt/hadoop.tar.gz*  

WORKDIR /opt/hadoop

# For starting the ssh
RUN  mkdir /var/run/sshd \
    && echo 'root:hdfsroot' | chpasswd \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

COPY ./config/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
COPY ./config/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml
COPY ssh-keys/id_rsa /root/.ssh/id_rsa
COPY ssh-keys/id_rsa.pub /root/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]