#!/bin/sh

printf "\n---- Running composer first time ----\n"
docker-compose run composer install
docker-compose run composer clearcache
printf "\n"