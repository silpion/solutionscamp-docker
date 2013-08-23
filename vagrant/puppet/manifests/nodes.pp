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
  }

}

node scdapp inherits base{
}

node scdadm inherits base{
}
