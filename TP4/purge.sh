docker stop $(docker ps -a)
docker kill $(docekr ps -a)
docker volume prune
docker network prune

