# Pseudo site configuration

Exec{
  path      => [
      '/usr/local/sbin',
      '/usr/local/bin',
      '/usr/sbin',
      '/usr/bin',
      '/sbin',
      '/bin'
    ],
  timeout   =>  120,
  logoutput =>  on_failure,
}

stage{'pre':} -> Stage['main'] -> stage{'post':}

import 'nodes.pp'
