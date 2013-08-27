node base{
  class { 'docker': }
    ->
  class { 'solutionscamphacks': }
}

node scdreg inherits base{

  docker::image{'samalba/docker-registry':
    ensure    => present,
  }

  docker::run{'registry':
    image     => 'samalba/docker-registry',
    #command   => 'gunicorn --access-logfile - --log-level debug --debug -b 0.0.0.0:80 -w 1 wsgi:application',
    command   => '',
    ports     => ['5000:5000'],
    require   => Docker::Image['samalba/docker-registry'],
  }

}

node scdapp inherits base{

  docker::image{'registry.silpion.de:5000/silpion/jenkins':
    ensure    => present,
  }

  docker::run{'jenkins':
    image     => 'silpion/jenkins',
    command   => '/usr/local/sbin/jenkins.sh',
    ports     => ['8080:8080', '8443:8443'],
    require   => Docker::Image['registry.silpion.de:5000/silpion/jenkins'],
  }

}

node scdadm{

  class {'docker': }
    ->
  class {'solutionscamphacks': }
    ->
  class {'solutionscamphacks::adm': }

}
