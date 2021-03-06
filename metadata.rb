name             'chef_cassandra'
maintainer       'Raintank, Inc.'
maintainer_email 'cookbooks@raintank.io'
license          'Apache 2.0'
description      'Installs/Configures chef_cassandra'
long_description 'Installs/Configures chef_cassandra'
version          '0.1.4'

depends 'apt', '~> 2.7.0'
depends 'java', '~> 1.40.0'
depends 'lvm', '~> 1.3.6'
depends 'logrotate', '~> 1.9.1'
depends 'chef_base', '~> 0.1.0'
