nvm install 16

lsof -i:5000
kill -9 PID

docker build lh .
docker images

docker run -p 50:5000 lh
# host : container
docker ps

