# Manage a MongoDB installation
class php {
	package { 'php5-dev':
		ensure => latest;
    }

    package { 'php5-cli':
        ensure => latest;
    }

    package { "php-pear":
  	    ensure => latest,
    }

    package { "php5-xdebug":
  	    ensure => latest,
    }

    package { "php5-mcrypt":
  	    ensure => latest,
    }

    package { "php5-gd":
  	    ensure => latest,
    }

    package { "php5-curl":
        ensure => latest,
    }

    package { "php5-xcache":
        ensure => latest,
    }

    package { "php-apc":
        ensure => latest,
    }

    package { "php5-pgsql":
        ensure => latest,
    }

    package { "php5-mysqlnd":
        ensure => latest,
    }

    package { "php5-memcached":
        ensure => latest,
    }

    package { "php5-sqlite":
        ensure => latest,
    }

    package { "phpmyadmin":
        ensure => latest,
        require => Package['apache2']
    }

	exec {"/usr/bin/pecl install mongo":
    	require => [Package['php5-dev'], Package['make']]
    }

	exec {"/usr/bin/pecl install redis":
    	require => [Package['php5-dev'], Package['make']]
    }

    package { "libapache2-mod-php5":
    	ensure => present,
    	require => [Package['apache2'], Package['php5-dev']]
    }
}