class couchdb {

	 exec {
        "add_couchdb_ppa":
            command => '/usr/bin/add-apt-repository ppa:longsleep/couchdb -y',
            require => [
                Package['python-software-properties'],
                Exec['apt-get update']
            ]
    }

    package { 'couchdb':
        ensure => latest,
        require => Exec['add_couchdb_ppa']
    }

    service { 'couchdb':
        ensure => running,
        enable => true,
        require => [
            Exec['add_couchdb_ppa'],
            Package['couchdb']
        ]
    }

    file { "/etc/couchdb/local.ini":
        ensure => present,
        require => Package['couchdb'],
        notify => Service['couchdb'],
        source => "/vagrant/_build/templates/couchdb/local.ini"
    }
}