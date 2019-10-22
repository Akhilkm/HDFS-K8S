#!/bin/bash
hdfs namenode -format
hdfs --daemon start namenode
service ssh start

while true
do
	if [[ -z $(jps | grep "NameNode") ]] || [[ -z $(ps -ef | grep "/usr/sbin/sshd") ]] ; then 
        echo "$(date): Namenode/sshd stopped";
        exit
    fi
done