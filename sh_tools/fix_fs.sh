#!/bin/sh
WORK_DIR="../symfony"

printf "\n---- Creating upload dir in web/uploads ----\n"

mkdir "${WORK_DIR}"web/uploads
chmod -R 777 web/uploads
printf "\n"

printf "\n---- Fixing directory permissions ----\n"
chmod -R 777 "${WORK_DIR}"var/cache "${WORK_DIR}"var/logs
printf "\n"

printf "\n---- Clear cache ----\n"
docker-compose exec php bin/console cache:clear
printf "\n"

printf "\n---- DONE! ----\n\n"
