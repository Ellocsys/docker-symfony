#!/bin/sh

printf "\n---- Clear cache ----\n"
docker-compose exec php bin/console cache:clear
printf "\n"

printf "\n---- Creating upload dir in web/uploads ----\n"
cd ../symfony
mkdir web/uploads
chmod -R 777 web/uploads
printf "\n"

printf "\n---- Fixing directory permissions ----\n"
chmod -R 777 var/cache var/logs
printf "\n"

printf "\n---- DONE! ----\n\n"
