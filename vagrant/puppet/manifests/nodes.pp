node scdreg{

  class {'docker': }
    ->
  class { 'solutionscamphacks': }
    ->

  docker::image{'samalba/docker-registry':
    ensure    => present,
  }

  docker::run{'registry':
    image     => 'samalba/docker-registry',
    command   => '',
    ports     => ['5000:5000'],
    require   => Docker::Image['samalba/docker-registry'],
  }

}

node scdapp{

  class {'docker': }
    ->
  class { 'solutionscamphacks': }
    ->

  docker::image{'registry.silpion.de:5000/silpion/jenkins':
    ensure    => present,
  }

  docker::run{'jenkins':
    image     => 'registry.silpion.de:5000/silpion/jenkins',
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
