#!/bin/bash
sudo docker swarm init --advertise-addr=192.168.0.120
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh



cd /vagrant
#Criando dois registros para as imagens dos serviços web e db 

sudo docker service create --name registry --publish published=5000,target=5000 registry:2
sudo docker service create --name registry-banco --publish published=4000,target=5000 registry:2
sudo docker compose up -d 
sudo docker compose down --volumes
sudo docker compose push
sudo docker stack deploy --compose-file docker-compose.yml p2 



