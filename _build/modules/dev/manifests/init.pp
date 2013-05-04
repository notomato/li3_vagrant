# Manage a Vagrants development installation
class dev {

    require ruby

    package {
        'git': ensure => latest;
    }

    package {
        'curl': ensure => latest;
    }

    package {
        "make": ensure => latest
    }

	package {
		"vim": ensure => latest
    }

    package {
		"python-setuptools": ensure => latest
    }

    exec {
        'add nodejs repo':
            command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js -y',
            require => [
                Package['python-software-properties'],
                Exec['apt-get update']
            ]
    }

    exec {
        'install nodejs':
            command => 'apt-get install nodejs -y',
            require => 'add nodejs repo';

    }

    package {
		"python": ensure => latest
    }

    package {
        [
            'puppet-lint',
            'librarian-puppet'
        ]:
        ensure   => latest,
        provider => 'gem';
    }
}