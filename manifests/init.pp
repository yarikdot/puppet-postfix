# Class postfix
#
#

class postfix {

  include ::postfix::params

#  anchor{ 'postfix::begin':
#    before => Class['::postfix::install'],
#    notify => Class['::postfix::service'],
#  }
#  anchor { 'nginx::end':
#    require => Class['::postfix::service'],
#  }

  Class['postfix::install'] -> Postfix::Instance <| |>

}
