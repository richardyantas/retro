#!/bin/bash
sudo apt-get update 
sudo apt-get install -yq build-essential python3-pip rsync git

# install docker https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04

git clone https://github.com/richardyantas/retro.git
cd retro/backend/
docker build -t mlops:latest .
docker run -d -p 5000:5000 mlops 