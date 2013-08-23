# solutionscamp-docker

Material for the docker space at solutionscamp 2013


# Requirements

- [git](http://git-scm.com)
- [vagrant](http://vagrantup.com)
- ([virtualbox](https://www.virtualbox.org/))

Any system supported by Vagrant to manage virtual machines can be
used. This project's Vagrant configuration only supports VirtualBox.


# Target

Three virtual machines managed through Vagrant shall provide an
environment to learn you some docker.

There'll be a workstation, where you can play and generate docker
container images.

There'll be an index server, which can be used to push and pull
images to/from.**

There'll be an application server, where the generated containers can
get pulled to and started on.


** The index server is prepared and pre-configured for this space. It
  uses an AWS storage to host container images. The AWS account in
  question will get disabled shortly after solutionscamp and render
  the pre-configured docker image unusable without modification.
  To set up an index server yourself see 
  [dotcloud/docker-registry](https://github.com/dotcloud/docker-registry).


# Submodules

This repository uses git submodules to integrate puppet modules
required to provision the nodes.

    ```bash
    git submodule init
    git submodule update
    ```


# Ramping up

Go to the vagrant directory and fire up the machines consecutively.
* Index server
* Administrative workstation
* Application server

    ```bash
    cd vagrant
    vagrant up idx
    vagrant up adm
    vagrant up app
    ```


# Remarks

Using Vagrant with VirtualBox in private network mode triggers a number
of bugs possibly related to any component of this project. These
components may be any of
* [vagrant](http://vagrantup.com)
* [VirtualBox](https://www.virtualbox.org)
* [Ubuntu](http://www.ubuntu.com)

In general whenever possible use VirtualBox internal NAT for networking
configuration.

## Waiting 120 seconds...

On any VM startup using Vagrant except for the very first one, booting
Ubuntu feels to take hours.
This seems related to bugs in VirtualBox private network mode. To fix
this issue it would be required to configure the box running in
VirtualBox and exporting it with exact that configuration, which drives
using Vagrant ad absurdum.


<!-- vim: set nofen ts=4 sw=4 et: -->
