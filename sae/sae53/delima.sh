#Supprimer toutes les images
docker rmi $(docker images -q)
