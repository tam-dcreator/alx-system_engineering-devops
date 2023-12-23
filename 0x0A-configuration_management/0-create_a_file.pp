# This source file creates a file in /tmp

file { '0-create_a_file.pp':
  path    => '/tmp/school',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
}
