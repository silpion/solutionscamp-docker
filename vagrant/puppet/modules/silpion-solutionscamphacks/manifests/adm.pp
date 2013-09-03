# == Class: solutionscamphacks::adm
#
# Puppet hacks to automate some docker commands on the workstation like
#   system of that solutionscamp project.
#
# === Authors
#
# Mark Kusch <mark.kusch@silpion.de>
#
# === Copyright
#
# Copyright 2013 Silion IT Solutions GmbH
#
class solutionscamphacks::adm {

  # build a docker container for running jenkins
  # tag that image for our private registry
  # push that image to our private registry
  exec{
    'docker build -t silpion/jenkins:solutionscamp':
      command   => 'docker build -t silpion/jenkins:solutionscamp .',
      timeout   => '3600',
      unless    => 'docker images | grep -qE "^silpion/jenkins\s+solutionscamp"',
      cwd       => '/vagrant';

    'docker tag registry.silpion.de:5000/silpion/jenkins':
      command   =>
        'docker tag "$( docker images | awk \'/^silpion\/jenkins/{print $3}\' )" registry.silpion.de:5000/silpion/jenkins',
      unless    => 'docker images | grep -qE "^registry.silpion.de:5000/silpion/jenkins"',
      require   => Exec['docker build -t silpion/jenkins:solutionscamp'];

    'docker push registry.silpion.de:5000/silpion/jenkins':
      timeout   => '3600',
      require   => [
          Exec['docker tag registry.silpion.de:5000/silpion/jenkins']
        ];
  }

}
