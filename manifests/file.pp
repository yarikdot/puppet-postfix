# Define: postfix::file
#
# Install any flat postfix configuration file. See also postfix::dbfile.
#
# Parameters:
#  $postfixdir:
#    Directory where to manage the dbfile. Default: /etc/postfix
#  $owner:
#    The dbfile owner. Default: root
#  $group:
#    The dbfile group. Default: root
#  $mode:
#    The dbfile mode. Default: 0644
#  $content:
#    The dbfile content, typically from a template. Default: none
#  $source:
#    The dbfile source file. Default: none
#  $ensure:
#    The dbfile's presence. Use 'absent' to remove it. Default: present
#
# Sample Usage :
#   postfix::file { 'header_checks':
#     source => 'puppet:///modules/mymodule/postfix/header_checks',
#   }
#
define postfix::file (
  $postfixdir = '/etc/postfix',
  $filename   = undef,
  $owner      = 'root',
  $group      = 'root',
  $mode       = '0644',
  $content    = undef,
  $source     = undef,
  $ensure     = undef
) {

#  include '::postfix::params'

  $real_filename = $filename ? {
    undef    => "${postfixdir}/${title}",
    default  => "${postfixdir}/${filename}",
  }

  file { $real_filename:
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => $content,
    source  => $source,
    notify  => Service['postfix'],
#    require => Package['postfix'],
  }

}

