# Tag image
docker tag flask-app:latest goldin2008/flask-app:latest

# Login to docker-hub
docker login --username=goldin2008

# Push image
docker push goldin2008/flask-app:latest