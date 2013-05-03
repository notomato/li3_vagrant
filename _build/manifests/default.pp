define apache::loadmodule () {
	exec { "/usr/bin/a2enmod $name" :
		unless => "/bin/ls /etc/apache2/mods-enabled/${name}.load",
		notify => Service['apache2']
	}
}

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

include stdlib
include apt
include dev
include ntp
include php54
include php
include java
include ruby
include apache2
#include nginx
include mongodb
include elasticsearch
include beanstalkd
#include redis

file { "/etc/apache2/sites-available/default":
	ensure => present,
	source => "/vagrant/_build/manifests/apache.default",
	require => Package["apache2"]
}

file { "/etc/defaults/beanstalkd":
	ensure => present,
	source => "/vagrant/_build/manifests/beanstalkd.default",
	require => Package["beanstalkd"]
}