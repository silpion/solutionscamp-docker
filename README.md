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


# Getting started

## Submodules

This repository uses git submodules to integrate puppet modules
required to provision the nodes.

    ```bash
    git submodule init
    git submodule update
    ```

## Ramping up

Go to the vagrant directory and fire up the machines consecutively.
Wait for the provisioning to finish. This may take some time depending
on your internet connection speed.

* Registry server
* Administrative workstation
* Application server

    ```bash
    cd vagrant
    vagrant up reg
    vagrant up adm
    vagrant up app
    ```

# Vagrant configuration

Vagrant creates 3 machines with host internal networking configuration.
Internal network is set up to use 10.11.12.8/29. Vagrant will configure
your host to use the first available IP in that network.

* reg
* adm
* app

Vagrant does not touch the hosts DNS configuration. If you want to
access those VMs you'll have to stick with IPs or modify your DNS
configuration yourself.

The following configuration gets applied to the VMs:

| Host | Internal DNS alias  | IP          |
| ---- | ------------------- | ----------- |
| reg  | registry.silpion.de | 10.11.12.13 |
| adm  | -                   | 10.11.12.12 |
| app  | app.silpion.de      | 10.11.12.11 |


<!-- vim: set nofen ts=4 sw=4 et: -->
