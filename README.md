# HDFS-K8S
[HDFS](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html) cluster running in [kubernetes](https://kubernetes.io/)
### Note
This repository is created specifically for Azure. Required changes for using with other cloud providers.
* Hadoop Version 3.2.1
* Require Kubernetes version 13 or later.

### Folder structure
* configs
    configuration files for running the cluster
* images
    dockerfile
* K8S
    Kubernetes configuration files
* README.MD
    README file
* run.sh
    Config files are created as configmaps and mounted into the pod for the application to use. "run.sh" will create the configmaps under the configs folder.

### Reference
[Reference1](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html)

