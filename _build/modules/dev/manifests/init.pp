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

    package {
		"nodejs": ensure => latest
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