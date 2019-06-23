name 'rio_kibana'
maintainer 'Robert D. Thurston'
maintainer_email 'rdt@redoubt.io'
license 'MIT License'
description 'Installs/Configures Kibana for a demo lab environment.'
long_description 'Installs/Configures Kibana for a demo lab environment. This is from a blog article at https://www.redoubt.io'
version '0.1.0'
chef_version '>= 14.0'
source_url 'https://github.com/rdt-redoubtio/logmanagement'
supports 'linux'

depends 'firewalld'
depends 'ohai'
depends 'hurry-up-and-test'