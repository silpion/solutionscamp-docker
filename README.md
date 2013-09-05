# solutionscamp-docker

Material for the docker space at solutionscamp 2013


# Requirements

- [git](http://git-scm.com)
- [vagrant](http://vagrantup.com)
- ([virtualbox](https://www.virtualbox.org/))

Any system supported by Vagrant to manage virtual machines can be
used. This project's Vagrant configuration supports VirtualBox only.


# Target

Three virtual machines managed through Vagrant shall provide an
environment to learn you some docker.
There'll be a workstation, where you can play and generate docker
container images.
There'll be a registry server, which can be used to push and pull
images to/from.
There'll be an application server, where the generated containers can
get pulled to and started on.

Target is to enable the audience to be able to relate to automated
containerization using [docker](http://docker.io) right during the
space.


# Getting started

## Submodules

This repository uses git submodules to integrate puppet modules
required to provision the nodes.

    ```shell
    git submodule init
    git submodule update
    ```

## Ramping up

Go to the vagrant directory and fire up the machines consecutively.
Wait for the provisioning to finish. This may take some time depending
on your internet connection speed.

    ```shell
    cd vagrant
    vagrant up reg
    vagrant up adm
    vagrant up app
    ```

If everything went fine point your browser to
* http://localhost:18080

Port 18080 is forwarded to the app VM to port 8080 which is where
the application container listens on.

Alternatively you can directly connect to the VM using
* http://10.11.12.12:8080


### Provisioning

Provisioning for the Vagrant boxes is done using
[Puppet](http://puppetlabs.com). (Don't even ask!) Puppet is wrapped in
a shell script which fixes some annoyances with networking for the
virtual machines. All required Puppet modules are either part of this
project or managed as Git submodules.


#### solutionscamp-hacks

This project is not inteded to be clean, out of hacks, test-driven or
any of such things which describe software development paradigms today.


# Vagrant configuration

Vagrant creates 3 machines with host internal networking configuration.
Internal network is set up to use 10.11.12.8/29. Vagrant will configure
your host to use the first available IP in that network (should be
10.11.12.9).

* reg
* adm
* app

Vagrant does not touch the hosts DNS configuration. If you want to
access those VMs you'll have to stick with IPs or modify your DNS
configuration yourself.

The following configuration gets applied to the VMs:

| VM  | VirtualBox VM name | Internal DNS alias  | IP          |
| --- | ------------------ | ------------------- | ----------- |
| reg | scdreg             | registry.silpion.de | 10.11.12.13 |
| adm | scdadm             | -                   | 10.11.12.11 |
| app | scdapp             | app.silpion.de      | 10.11.12.12 |


## Port forwardings

| VM  | Host Port | Guest Port | Service                |
| --- | --------- | ---------- | ---------------------- |
| reg | 5000      | 5000       | docker registry server |
| app | 18080     | 8080       | target application     |


# Remarks

## docker

docker is not stable yet! Provisioning installs latest version of
docker which might have introduced bugs or behaviour not known to us
at the moment of this writing. There is heavy development in docker
which may break this project and there are many releases providing
better stability or new features quite often, or new bugs, problems
or misc other change in behaviour.
A [production ready release](http://blog.docker.io/2013/08/getting-to-docker-1-0/)
is scheduled for October 2013.

## Environment

Provisioning on the nodes rely on internet connection. During the
development of this prototype the most common issue with automation
was networking issues, e.g.
* fetching the private registry container from AWS
* installing an application in a container using the distributions
  package management systems


<!-- vim: set nofen ts=4 sw=4 et: -->
