name              'rackspace_openssh'
maintainer        'Rackspace, US Inc.'
maintainer_email  'rackspace-cookbooks@rackspace.com'
license           'Apache 2.0'
description       'Installs openssh'
version           '2.0.0'

recipe 'rackspace_openssh', 'Installs openssh'
recipe 'rackspace_openssh::iptables', 'Set up iptables to allow SSH inbound'

supports 'centos'
supports 'debian'
supports 'redhat'
supports 'ubuntu'

depends 'iptables'
