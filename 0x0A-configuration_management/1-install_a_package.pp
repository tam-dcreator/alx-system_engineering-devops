# This source file installs flask from pip3

package { 'Flask':
  ensure   => '2.1.0',
  name     => 'flask',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.0.2',
  name     => 'werkzeug',
  provider => 'pip3',
}

# Downgrade werkzeug so its compactible with version 2.1.0 of flask
