Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

Package {
	require => Exec["apt-get update"]
}

File {
	require => Exec["apt-get update"]
}

exec { "apt-get update":
	 command => '/usr/bin/apt-get update',
     require => Exec['add php54 apt-repo']
}

exec { "apt-get upgrade":
	refreshonly => true,
	command => 'sudo apt-get -y dist-upgrade'
}

include stdlib
include apt
include dev
include ntp
include php54
include php
include java
include ruby
include apache2
include mongodb
include mysql
include postgres
include couchdb
include elasticsearch
include beanstalkd
include memcached
include redis

apache::loadmodule{"rewrite": }

file { "/etc/apache2/mods-enabled/rewrite.load":
	ensure => link,
	target => "/etc/apache2/mods-available/rewrite.load",
	require => Package['apache2'],
	notify => Service['apache2']
}

file { "/etc/apache2/sites-available/default":
	ensure => present,
	source => "/vagrant/_build/templates/apache2/default",
	require => Package["apache2"],
	notify => Service['apache2']
}

file { "/etc/php5/apache2/php.ini":
	ensure => present,
	require => [Package['apache2'], Package['php5-dev'], Package['libapache2-mod-php5']],
	source => "/vagrant/_build/templates/php/php.ini",
	notify => Service['apache2']
}

exec { "php_cli":
	require => Package['php5-dev'],
	command => "/usr/bin/sudo ln -sf /etc/php5/apache2/php.ini /etc/php5/cli/php.ini"
}

# Start beanstalkd
file { "/etc/default/beanstalkd":
	ensure => present,
	source => "/vagrant/_build/templates/beanstalkd/default",
	require => Package["beanstalkd"]
}

file { "/etc/init.d/beanstalkd":
	ensure => present,
	source => "/vagrant/_build/templates/beanstalkd/init.d",
	require => Package["beanstalkd"]
}

exec { "resources_permissions":
    command => "chmod -R 0777 /vagrant/app/resources"
}

# Redis commander
exec {
    "install_redis_commander":
        command => "npm install -g redis-commander",
        require => [
            Package['redis-server'],
            Exec["add_nodejs_repo"],
            Exec["install_nodejs"]
        ];
    "run_redis_commander":
            command => "redis-commander -p 7500&",
            require => [
                Package['redis-server'],
                Exec["add_nodejs_repo"],
                Exec["install_redis_commander"]
            ];

}

# rockmongo
exec {
	"install_rockmongo":
		command => "git clone https://github.com/iwind/rockmongo.git /var/www/tools/rockmongo",
		require => Package['git']
}

# https://github.com/ptrofimov/beanstalk_console.git
exec {
	"install_beanstalk_console":
		command => "git clone https://github.com/ptrofimov/beanstalk_console.git /var/www/tools/beanstalk_console",
		require => Package['git']
}

file { "/var/www/tools/beanstalk_console/lib/include.php":
	ensure => present,
	require => Exec['install_beanstalk_console'],
	source => "/vagrant/_build/templates/beanstalk_console/include.php"
}

