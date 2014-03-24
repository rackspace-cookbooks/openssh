name              'rackspace_openssh'
maintainer        'Rackspace, US Inc.'
maintainer_email  'rackspace-cookbooks@rackspace.com'
license           'Apache 2.0'
description       'Installs openssh'
version           '3.0.0'

recipe 'rackspace_openssh', 'Installs openssh'

supports 'centos'
supports 'debian'
supports 'redhat'
supports 'ubuntu'
