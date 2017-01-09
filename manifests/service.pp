# Class postfix::service
#
# Postfix service management

class postfix::service (
    $service_restart        = $::postfix::params::service_restart,
){

    service { 'postfix':
        require    => Package['postfix'],
        enable     => true,
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
#        restart   => $service_restart,
    }

}
