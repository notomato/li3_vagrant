class memcached {
    package { 'memcached':
        ensure => latest,
        require => Exec['apt-get update']
    }
}