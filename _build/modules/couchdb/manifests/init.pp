class couchdb {
    package { 'couchdb':
        ensure => latest,
        require => Exec['apt-get update']
    }
}