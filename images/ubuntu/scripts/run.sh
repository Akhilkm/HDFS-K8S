#!/bin/bash
hdfs namenode -format
hdfs --daemon start namenode
service ssh start

nameNodeStatus=$(jps | grep "NameNode")
sshStatus=$(ps -ef | grep "/usr/sbin/sshd")
while true
do
	if [[ $nameNodeStatus == *NameNode ]]; then 
        echo "$(date): Namenode is running"; 
    else
        echo "$(date): Namenode stopped";
        exit
    fi
    if [[ $sshStatus == *sshd* ]]; then 
        echo "$(date): sshd is running"; 
    else
        echo "$(date): sshd stopped";
        exit
    fi
done