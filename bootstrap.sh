#!/bin/bash
sudo apt-get update
sudo apt-get install -yq build-essential python3-pip rsync screen git pipenv
git clone https://github.com/richardyantas/tenpo.git
cd tenpo/
sudo pipenv shell
pipenv install
screen -S app
python3 app.py&