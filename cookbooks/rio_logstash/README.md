# rio_kibana

Installs and configures Logstash 7.X

## Supports
- CentOS 7

## Recipes

- `default` - Does nothing
- `install` - Sets up required YUM repositories, installs dependancies and installs Logstash
- `config` - Configures Elasticsearch
- `firewall` - Configures the firewalld service for Logstash
- `service` - Enables and starts the Logstash service

## Attributes
- `elasticsearch` - An array of Elasticsearch hosts to connect to for storing data using the Default-Output.conf configuration

## Maintainers
- [Robert Thurston](rdt@redoubt.io)