#
# == Class: puppet-voms::install-clients
# Install voms-clients package and sets up a few directories.
# 
class puppet-voms::install-clients {

  include emi3-release
  include egi-trust-anchors

  package { "install-voms-clients3": 
  name  => 'voms-clients3',
  ensure  => latest, 
  require => Class["emi3-release"]
  }

  file{'/etc/grid-security/vomsdir':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 0755,
    purge   => true,
    recurse => true,
    require => Class['egi-trust-anchors'],
  }

  file{'/etc/vomses':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => 0755,
    purge   => true,
    recurse => true,
    require => Class['egi-trust-anchors'],
  }

}
