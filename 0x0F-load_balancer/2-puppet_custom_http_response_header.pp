# Puppet configuration for custom HTTP header

# Update system and install nginx
exec { 'apt-get update; apt-get -y install nginx':
  path => '/usr/bin',
}

# Ensure Nginx is present
package { 'nginx':
  ensure => 'present',
}

# Set Homepage content
exec {'Hello':
  command  => 'echo "Hello World!" | tee /var/www/html/index.html',
  provider => shell,
}

# Set custom header
exec { 'sed -i "s/server_name _;/server_name _;\\n\\tadd_header X-Served-By $host;\\n/" /etc/nginx/sites-enabled/default':
  provider => shell,
}

# Restart Nginx
exec {'run':
  command  => 'service nginx restart',
  provider => shell,
}
