#!/bin/sh
WORK_DIR="../symfony/"

printf "\n---- Creating upload dir in web/uploads ----\n"

docker-compose exec php mkdir web/uploads
docker-compose exec php chmod -R 777 web/uploads
printf "\n"

printf "\n---- Fixing directory permissions ----\n"
# touch "${WORK_DIR}"var/logs/prod.log
# touch "${WORK_DIR}"var/logs/dev.log
docker-compose exec php chmod -R 777 var/cache var/logs var/sessions
printf "\n"

printf "\n---- Clear cache ----\n"
docker-compose exec php bin/console cache:clear
docker-compose exec php bin/console cache:clear --env=prod
printf "\n"
