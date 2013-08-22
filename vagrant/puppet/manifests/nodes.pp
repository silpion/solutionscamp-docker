node base{
  include docker
  include solutionscamphacks
}

node scdidx inherits base{
}

node scdapp inherits base{
}

node scdadm inherits base{
}
