name             "tennis-ace"
maintainer       "ZehnerGroup"
maintainer_email "hello@zehnergroup.com"
license          "All rights reserved"
description      "Installs/Configures Tennis.com AceCMS"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'hostsfile',            '= 1.0.1'
depends 'build-essential',      '= 1.4.0'
depends 'apt',                  '= 1.9.2'
depends 'application',          '= 2.0.2'
depends 'application_python',   '= 1.2.2'
depends 'python',               '= 1.2.2'
depends 'mysql',                '= 3.0.0'
depends 'database',             '= 1.4.0'
depends 'github'
depends 'nginx'
depends 'supervisor',           '= 0.4.0'
<<<<<<< HEAD
depends 'php'
depends 'rabbitmq'
depends 'memcached'

=======
>>>>>>> 226dcaef3d7a72a9c1c6126b1693f0529f730ce5
