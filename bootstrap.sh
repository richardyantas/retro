sudo apt-get update
sudo apt-get install -yq build-essential python3-pip rsync screen
pip install pipenv
git clone https://github.com/richardyantas/tenpo.git
cd tenpo/
pipenv shell
pipenv install
screen -S app
python3 app.py&