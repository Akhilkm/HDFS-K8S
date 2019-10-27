# Base image openjdk8
FROM alpine:3.5

MAINTAINER DevOps <akhilu011@gmail.com>
# Default to UTF-8 file.encoding

RUN apk update \
    && apk add --no-cache --update gnupg ca-certificates su-exec util-linux bash wget curl openjdk8 \
    && adduser -D hadoop

USER hadoop

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin
ENV HADOOP_VERSION 3.2.1
ENV HADOOP_HOME /home/hadoop/hadoop
ENV HADOOP_HDFS_HOME /home/hadoop/hadoop
ENV HADOOP_COMMON_HOME /home/hadoop/hadoop
ENV PATH ${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
ENV HADOOP_OPTS "-Ddfs.name.dir=/home/hadoop/hadoop/data/nameNode -Ddfs.data.dir=/home/hadoop/hadoop/data/dataNode -Dfs.default.name=hdfs://namenode:9000"


RUN cd ~ \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz.asc \
    && wget https://www.apache.org/dist/hadoop/common/KEYS \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
    && gpg --import KEYS \
    && gpg --verify hadoop-$HADOOP_VERSION.tar.gz.asc hadoop-$HADOOP_VERSION.tar.gz \
    && tar -zxf hadoop-$HADOOP_VERSION.tar.gz \
    && ln -s hadoop-$HADOOP_VERSION hadoop  \
    && rm -rf hadoop-$HADOOP_VERSION.tar.gz.asc hadoop-$HADOOP_VERSION.tar.gz KEYS 

# ADD ./config/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
# ADD ./config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

# USER root
# RUN chown hadoop:hadoop $HADOOP_HOME/etc/hadoop/core-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml 
# USER hadoop

RUN [ "hdfs", "namenode", "-format" ]

WORKDIR /home/hadoop/hadoop

CMD [ "hdfs", "namenode" ]



