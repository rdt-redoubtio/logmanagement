# rio_kibana

Installs and configures Kibana 7.X

## Supports
- CentOS 7

## Recipes

- `default` - Does nothing
- `install` - Sets up required YUM repositories, installs dependancies and installs Kibana
- `config` - Configures Elasticsearch
- `firewall` - Configures the firewalld service for Kibana
- `service` - Enables and starts the Kibana service

## Attributes
- `elasticsearch` - An array of values for the Elasticsearch nodes you will connect to
- `kibanaport` - The TCP port number to bind the Kibana process to

## Maintainers
- [Robert Thurston](rdt@redoubt.io)