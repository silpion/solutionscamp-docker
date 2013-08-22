# Self-sufficient container management with docker

IT systems evolved from thick applications, thick clients and monolitic
physical infrastructure to thin applications using any number of services
running on any available set of physical resources (public/private/
virtualized).

Docker is a utility to automate and manage containers based on LXC
(Linux Containers). Provided is a very simple instruction language to
automatically build containers (applications) idempotent, support for
pushing container images to a central distribution hub (index server),
fetching and starting container images on any node with the guarantee of
no environmental dependency issues or divergency in behaviour, solving
problems in IT evolution like application isolation, deployment of
applications in any stage of software development, repeatability, and
many many more.

This session is about simplicity. We will
- provision a node as a docker index server (using docker!)
- provision a node as a workstation
  - automatically build a container image for an application
  - publish the resulting container image using our index server
- provision a node as an application server
  - pull the application container image and start a container
- access the application on the application server,
all on virtual machines managed by Vagrant.

Nodes will get provisioned with [http://puppetlabs.com](Puppet).


<!-- vim: set nofen ts=4 sw=4: -->
