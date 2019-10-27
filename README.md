# HDFS-K8S
[HDFS](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html) cluster running in [kubernetes](https://kubernetes.io/)
### Note

### What is HDFS

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

