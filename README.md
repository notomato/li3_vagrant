# li3_vagrant

This provides a complete vagrant box, with everything you need to get started with the Lithium PHP framework.

To get started in 4 steps:

~~~bash
git clone https://raw.github.com/notomato/li3_vagrant
cd li3_vagrant
composer install
vagrant up
~~~

If you open http://localhost:8081 you should see:

![Alt text](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/init.png)

The box is based on the default vagrant precise64 box. Credit for most of the modules goes to guardian/vagrants.

## Included software

#### Languages

 - PHP 5.4
 - Ruby latest
 - Python

#### Webserver

 - Apache2
 - Nginx (optional)

#### Databases

 - MongoDB
 - CouchDB
 - MySQL
 - PostgreSQL
 - Redis
 - Memcached

#### Search

 - Elasticsearch

#### Other

 - nodejs/npm

## Plugins and Extras

#### PHP

Apc monitoring panel

http://localhost:8081/tools/apc/ or http://192.168.50.4/tools/apc

![apc](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/apc.png)

#### PhpMyAdmin

Accessible at http://localhost:8081/phpmyadmin, default user is `root` with no password.

![phpMyAdmin](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/phpmyadmin.png "phpMyAdmin")

#### Elasticsearch Plugins

http://localhost:9201/_plugin/head/ or http://192.168.50.4:9200/_plugin/head/

![Elasticsearch head plugin](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/es_head.png "Elasticsearch head plugin")

http://localhost:9201/_plugin/paramedic/index.html or http://192.168.50.4:9200/_plugin/paramedic/index.html

![Elasticsearch paramedic plugin](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/es_paramedic.png "Elasticsearch paramedic plugin")

http://localhost:9201/_plugin/bigdesk/ or http://192.168.50.4:9200/_plugin/bigdesk/

!["Elasticsearch bigdesk plugin"](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/es_bigdesk.png "Elasticsearch bigdesk plugin")

#### MongoDb

Web interface: http://localhost:28018/ or http://192.168.50.4:28017

![Mongodb](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/mongodb.png "Optional title")

Rockmongo Admin GUI - default user/pass is admin/admin

http://localhost:8081/tools/rockmongo or http://192.168.50.4/tools/rockmongo

#### Couchdb

Futon: http://localhost:5985/_utils/ or http://192.168.50.4:5984/_utils/

![Futon](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/futon.png)

#### Redis

Redis-commander: http://localhost:7501 or http://192.168.50.4:7500

![Redis commander](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/redis_commander.png)

Note: this is not currently set to launch on reboot, just run `redis-commander -p 7500` to relaunch.

#### Memcached

Memcache monitoring panel

http://localhost:8081/tools/memcached/ or http://192.168.50.4/tools/memcached

![apc](https://raw.github.com/notomato/li3_vagrant/master/_docs/img/memcached.png)

#### Beanstalkd

Beanstalk console (https://github.com/ptrofimov/beanstalk_console)

http://localhost:8081/tools/beanstalk_console/ or http://192.168.50.4/tools/beanstalk_console


## Included plugins

Some popular plugins included, managed by composer. Take a look at composer.json to see how to add other plugins from git repositories.

 - li3_access
 - li3_docs
 - li3_quality
 - li3_paginate
 - li3_quality
 - li3_queue
 - lithium
 - manual




