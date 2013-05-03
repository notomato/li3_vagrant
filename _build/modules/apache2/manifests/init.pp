define apache::loadmodule () {
	exec { "/usr/sbin/a2enmod $name" :
		unless => "/bin/ls /etc/apache2/mods-enabled/${name}.load",
		notify => Service['apache2'],
		require => Package['apache2']
	}
}

# Manage an Apache2 installation
class apache2 {

  package {
    'apache2':
      ensure => latest;
  }

  service {
    'apache2':
      ensure => running,
      enable => true;
  }

  Package['apache2'] -> Service['apache2']
}