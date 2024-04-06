# Puppet configuration for Nginx
$str1 = 'server_name _;\\n\tlocation /redirect_me {\n\treturn 301;\n\t}\n'

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

# Set redirection using title instead of command attribute because of char len
exec { 'sed -i "s/server_name _;/server_name _;\\n\\tlocation \/redirect_me {\\n\\t\\treturn 301;\\n\\t}\\n/" /etc/nginx/sites-enabled/default':
  unless   => "grep -q '${str1}' /etc/nginx/sites-enabled/default",
  provider => shell,
}

# Restart Nginx
exec {'run':
  command  => 'service nginx restart',
  provider => shell,
}
