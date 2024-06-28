# Puppet manifest that kills a process called killmenow
exec { 'kill process':
  command => 'pkill killmenow',
  path    => '/usr/bin',
}
