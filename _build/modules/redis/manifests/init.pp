class redis {
    package { 'redis-server':
        ensure => latest,
        require => Exec['apt-get update']
    }
}