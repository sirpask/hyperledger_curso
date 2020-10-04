#!/bin/bash

echo damos permisos a docker.sock
sudo chmod 777 /var/run/docker.sock

echo Arrancamos portainer
docker run -d -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

sleep 2s

echo creamos variables del sistema
export CHANNEL_NAME=marketplace

export VERBOSE=false

export FABRIC_CFG_PATH=$PWD

echo arrancamos el canal en el couchdb
CHANNEL_NAME=$CHANNEL_NAME docker-compose -f docker-compose-cli-couchdb.yaml up -d

echo abrimos el couchdb
firefox http://localhost:9000