# Arrêter tous les conteneurs
docker stop $(docker ps -q)

# Supprimer tous les conteneurs arrêtés
docker rm $(docker ps -qa)
