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
        "add_nodejs_repo":
            command => '/usr/bin/add-apt-repository ppa:chris-lea/node.js -y',
            require => [
                Package['python-software-properties'],
                Exec['apt-get update']
            ]
    }

    exec {
        "install_nodejs":
            command => "apt-get install nodejs -y",
            require => Exec["add_nodejs_repo"]
    }

    exec {
        "install_npm":
            command =>  "apt-get install npm -y",
            require => [
                Exec["add_nodejs_repo"],
                Exec["install_nodejs"]
            ]
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