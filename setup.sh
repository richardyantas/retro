# sudo pip install wheel nginx gunicorn
# sudo apt install gunicorn
git add . && git commit -m "update" && git push origin main
docker build -t mlops:latest .
docker run -d -p 5000:5000 mlops