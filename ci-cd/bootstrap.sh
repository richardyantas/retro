#!/bin/bash
sudo apt-get update && \ 
sudo apt-get install -yq build-essential python3-pip rsync git  && \ 

# install docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && \


git clone https://github.com/richardyantas/tenpo.git  && \ 
cd tenpo/ && \ 
docker build -t mlops:latest . && \ 
docker run -d -p 5000:5000 mlops 