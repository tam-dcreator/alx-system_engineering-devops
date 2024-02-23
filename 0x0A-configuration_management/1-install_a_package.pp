# Puppet manifest that installs flask from pip3
package { 'Flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
}
