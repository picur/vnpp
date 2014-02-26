name             'common'
maintainer       'Botond Dani'
maintainer_email 'botond.dani@gmail.com'
license          'LICENSE'
description      'Installs/Configures Custom Project'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
supports         'ubuntu'

depends 'nginx', '2.2.0'
depends 'php', '1.3.12'
depends 'php-fpm', '0.6.3'