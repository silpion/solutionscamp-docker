# == Class: solutionscamphacks::adm
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
  exec{
    'docker build -t silpion/jenkins:solutionscamp':
      command   => 'docker build -t silpion/jenkins/solutionscamp .',
      cwd       => '/vagrant';

    'docker commit -m "Solutionscamp Jenkins" -author="Solutionscamp" -run "{\'Hostname\': \'jenkins\'}"':
      cwd       => '/vagrant',
      require   => Exec['docker build -t silpion/jenkins:solutionscamp'];
  }

}
