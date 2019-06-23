# rio_elasticsearch

Installs and configures Elasticsearch 7.X

## Supports
- CentOS 7

## Recipes

- `default` - Does nothing
- `install` - Sets up required YUM repositories, installs dependancies and installs Elasticsearch
- `config` - Configures Elasticsearch
- `firewall` - Configures the firewalld service for Elasticsearch database
- `maintenance` - Configures needed maintenance scripts to trim log data
- `service` - Enables and starts the Elasticsearch service

## Attributes
clustername - The name of the Elasticsearch cluster
clusternodes - An array of IP addresses for each node in the cluster, allowing for node discovery
clusterquorem - The minimum number of nodes within a cluster forming a quorem, avoiding "split brain" scenarios (this needs careful planning!)
lockmem - Whether or not to lock memory for the Elasticsearch process (this may require additional configuration on your system if set to true)
javaheapmem - The size of the Java Heap in GB. This is recommended to be _no more_ than 50% of your total system memory and your total system memory should not exceed 32GB per node.
initialmasternode - Name of the node which will serve as the initial master for bootstrapping the cluster (this is only used once at initial cluster creation and is then ignored)
indexmaxage - Maximum age of logstash incidies to keep around (used for trimming old logs and managing total database size via curator)

## Maintainers
- [Robert Thurston](rdt@redoubt.io)