# Base image openjdk8
FROM akhilkm/openjdk8:v1

MAINTAINER DevOps <akhilu011@gmail.com>
# Default to UTF-8 file.encoding

RUN apk update \
    && apk add --no-cache gnupg bash \
    && adduser -D hadoop

USER hadoop

RUN cd ~ \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz.asc \
    && wget https://www.apache.org/dist/hadoop/common/KEYS \
    && wget https://www.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz \
    && gpg --import KEYS \
    && gpg --verify hadoop-3.2.1.tar.gz.asc hadoop-3.2.1.tar.gz \
    && tar -zxvf hadoop-3.2.1.tar.gz \
    && ln -s hadoop hadoop-3.2.1 \
    && rm -rf hadoop-3.2.1.tar.gz.asc hadoop-3.2.1.tar.gz KEYS 

