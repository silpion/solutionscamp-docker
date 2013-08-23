#!/bin/bash


set -ex


: ${cmd_puppet:=$( command -v puppet )}
: ${cmd_ip:=$( command -v ip )}


# Puppet is used for provisioning
_provision()
{
  $cmd_puppet apply \
    --modulepath /opt/puppet/modules \
    /vagrant/puppet/manifests/site.pp
}


# I didn't manage to get networking running correctly.
#   Fix networking here with some hardcoded assumptions.
_networking()
{
  _ip="$( awk -v h=${HOSTNAME} '{if($0 ~ h){print $1}}' < /etc/hosts )"
  _net='10.11.12.8'
  _mask='29'
  _iface='eth2'
  $cmd_ip addr replace ${_ip}/${_mask} dev $_iface || true
  $cmd_ip link set dev $_iface up || true
  $cmd_ip route replace ${_net}/${_mask} via $_ip dev $_iface || true
}


# Run provisioning first. This will provide a usable /etc/hosts file
#   for any node in question.
_provision
_networking
