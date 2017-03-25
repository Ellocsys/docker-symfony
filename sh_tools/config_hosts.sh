#!/bin/sh

printf "\n---- Setting up hosts! ----\n"
IP="$(docker inspect --format '{{ .NetworkSettings.Networks.dockersymfony_default.Gateway }}' dockersymfony_nginx_1)"
echo  "${IP} symfony.dev" | sudo tee --append /etc/hosts
printf "\n"