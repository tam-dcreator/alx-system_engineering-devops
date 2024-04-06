# Puppet configuration for Nginx
$str1 = 'server_name _;
    location /redirect_me {
        return 301;
    }'

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

# Set redirection
exec { 'Redirection':
  command => "sed -i 's/server_name _;/${str1}/' /etc/nginx/sites-available/default",
  unless  => "grep -q '${str1}' /etc/nginx/sites-available/default",
}

# Restart Nginx
exec {'run':
  command  => 'service nginx restart',
  provider => shell,
}
