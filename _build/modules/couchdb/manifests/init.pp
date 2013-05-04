class couchdb {

    package { 'couchdb':
        ensure => latest,
        require => Exec['apt-get update']
    }

    service { 'couchdb':
        ensure => running,
        enable => true;
    }

    file { "/etc/couchdb/local.ini":
        ensure => present,
        require => Package['couchdb'],
        notify => Service['couchdb'],
        source => "/vagrant/_build/templates/couchdb/local.ini"
    }
}