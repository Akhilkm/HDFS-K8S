# Base image openjdk8
FROM akhilkm/openjdk8:v1

MAINTAINER DevOps <akhilu011@gmail.com>
# Default to UTF-8 file.encoding

RUN apk update \
    && apk add --no-cache gnupg bash curl \
    && adduser -D hadoop

ENV HADOOP_VERSION 3.2.1
ENV HADOOP_HOME /home/hadoop/hadoop
ENV HADOOP_HDFS_HOME /home/hadoop/hadoop
ENV HADOOP_COMMON_HOME /home/hadoop/hadoop
ENV PATH ${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV HDFS_NAMENODE_OPTS "-XX:+UseParallelGC -Xmx4g"


RUN cd ~ \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz.asc \
    && wget https://www.apache.org/dist/hadoop/common/KEYS \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
    && gpg --import KEYS \
    && gpg --verify hadoop-$HADOOP_VERSION.tar.gz.asc hadoop-$HADOOP_VERSION.tar.gz \
    && tar -zxvf hadoop-$HADOOP_VERSION.tar.gz \
    && ln -s hadoop-$HADOOP_VERSION hadoop  \
    && rm -rf hadoop-$HADOOP_VERSION.tar.gz.asc hadoop-$HADOOP_VERSION.tar.gz KEYS 

COPY ./config/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY ./config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
RUN chown hadoop:hadoop -R $HADOOP_HOME

USER hadoop

RUN [ "hdfs", "namenode", "-format" ]

WORKDIR /home/hadoop/hadoop

CMD [ "hdfs", "namenode" ]



