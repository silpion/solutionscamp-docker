node base{
  include docker
  include solutionscamphacks
}

node scdidx inherits base{

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

node scdapp inherits base{

  docker::image{'silpion/jenkins':
    registry  => 'scdidx:5000',
    ensure    => present,
  }

  docker::run{'jenkins':
    image     => 'silpion/jenkins',
    command   => '/usr/local/sbin/jenkins.sh',
    ports     => ['8080:8080', '8443:8443'],
    require   => Docker::Image['silpion/jenkins'],
  }

}

node scdadm inherits base{

  include solutionscamphacks::adm

}
