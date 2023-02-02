#!/bin/bash
sudo apt-get update && \ 
sudo apt-get install -yq build-essential python3-pip rsync git  && \ 
git clone https://github.com/richardyantas/tenpo.git  && \ 
cd tenpo/ && \ 
docker build -t mlops:latest . && \ 
docker run -d -p 5000:5000 mlops 