docker-symfony
==============

[![Build Status](https://secure.travis-ci.org/eko/docker-symfony.png?branch=master)](http://travis-ci.org/eko/docker-symfony)


Just a little Docker POC in order to have a complete stack for running Symfony into Docker containers using docker-compose tool.

# Installation

First, clone this repository:

```bash
$ git clone git@github.com:Ellocsys/docker-symfony.git
```

Next, put your Symfony application into `symfony` folder

_Note :_ if you install and config symfony installer you can create stock application by run:

```bash
$ symfony new symfony
```

Make sure you adjust `database_host` in `parameters.yml` to the database container alias "db" and db config in docker-compose.yml the same as in parametrs.yml

Then, run:

```bash
$ docker-compose up
```

Next, make init.sh executable and run it.
```bash
$ ./init.sh
```


This run scripts in sh_tools directory,which

fix_fs.sh - fix permisions for var/logs, var/cache and var/sesions

init_composer.sh - install composer dependecies

init_db.sh - create db, update schema and load fixtures

config_hosts.sh - automatic add in hosts file redirect for docker container

You are done, you can visit your Symfony application on the following URL: `http://symfony.dev` (and access Kibana on `http://symfony.dev:81`)


_Note :_ you can rebuild all Docker images by running:

```bash
$ docker-compose build
```

# How it works?

Here are the `docker-compose` built images:

* `db`: This is the MySQL database container (can be changed to postgresql or whatever in `docker-compose.yml` file),
* `php`: This is the PHP-FPM container including the application volume mounted on,
* `nginx`: This is the Nginx webserver container in which php volumes are mounted too,
* `composer`: This is the alpine based container with composer for install dependecies,
* `elk`: This is a ELK stack container which uses Logstash to collect logs, send them into Elasticsearch and visualize them with Kibana.

This results in the following running containers:

```bash
> $ docker-compose ps
        Name                      Command               State              Ports
        -------------------------------------------------------------------------------------------
        docker_db_1            /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp
        docker_elk_1           /usr/bin/supervisord -n -c ...   Up      0.0.0.0:81->80/tcp
        docker_nginx_1         nginx                            Up      443/tcp, 0.0.0.0:80->80/tcp
        docker_php_1           php5-fpm -F                      Up      9000/tcp
```

# Read logs

You can access Nginx and Symfony application logs in the following directories on your host machine:

* `logs/nginx`
* `logs/symfony`

# Use Kibana!

You can also use Kibana to visualize Nginx & Symfony logs by visiting `http://symfony.dev:81`.

# Code license

You are free to use the code in this repository under the terms of the 0-clause BSD license. LICENSE contains a copy of this license.
