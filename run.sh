#!/bin/bash

kubectl create configmap hdfs-site --from-file configs/hdfs-site.xml -n hdfs-cluster
kubectl create configmap core-site --from-file configs/core-site.xml -n hdfs-cluster