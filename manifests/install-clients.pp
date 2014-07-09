#
# == Class: puppet-voms::install-clients
# Install voms-clients package and sets up a few directories.
# 
class puppet-voms::install-clients {

  include puppet-emi3-release
  include puppet-egi-trust-anchors

  package { "install-voms-clients3": 
  name  => 'voms-clients3',
  ensure  => latest, 
  require => Class["puppet-emi3-release"]
  }

  file{['/etc/grid-security','/etc/grid-security/vomsdir']:
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 0755,
    purge   => true,
    require => Class['puppet-egi-trust-anchors'],
  }

  file{'/etc/vomses':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 0755,
    purge   => true,
    recurse => true,
    require => Class['puppet-egi-trust-anchors'],
  }

}
