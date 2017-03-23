#!/bin/sh

printf "\n---- Setting up database! ----\n"
echo "creating database"
docker-compose exec php bin/console doctrine:database:create
echo "update schema"
docker-compose exec php bin/console doctrine:schema:update --force
echo "load fixtures"
# docker-compose exec php bin/console doctrine:fixtures:load --no-interaction
printf "\n"