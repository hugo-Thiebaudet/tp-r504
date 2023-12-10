#!/bin/bash

# Fonction pour colorer le texte en vert
green() {
    echo -e "\e[32m$1\e[0m"
}

# Nom des images
MYSQL_IMAGE="im_mysql"
DOLIBARR_IMAGE="im_dolibarr"

# Vérifier si l'image MySQL existe
if docker images "$MYSQL_IMAGE" | grep "$MYSQL_IMAGE" > /dev/null; then
    green "L'image $MYSQL_IMAGE est déjà présente."
else
    # Construire l'image MySQL
    green "Construction de l'image $MYSQL_IMAGE..."
    docker build -t "$MYSQL_IMAGE" -f Dockerfile .
    sleep 5  # Pause de 5 secondes (ajoutez si nécessaire)
fi

# Vérifier si l'image Dolibarr existe
if docker images "$DOLIBARR_IMAGE" | grep "$DOLIBARR_IMAGE" > /dev/null; then
    green "L'image $DOLIBARR_IMAGE est déjà présente."
else
    # Construire l'image Dolibarr
    green "Construction de l'image $DOLIBARR_IMAGE..."
    docker build -t "$DOLIBARR_IMAGE" -f Dockerfile1 .
    sleep 5  # Pause de 5 secondes (ajoutez si nécessaire)
fi

# Lancement Conteneur Mysql
green "Lancement du SGBD"
mkdir -p shared/csv

docker run --rm -d \
   --name mysql_aa \
   --network sae \
   --env MYSQL_ROOT_PASSWORD=root \
   im_mysql 

# Attendre avant de remplir la bdd
green "Remplissage de la BDD"
sleep 15

# Remplissage BDD
mysql -h 172.19.0.2 -u root -p'root' -P 3306 < bdd1.sql

# Lancement Conteneur Dolibarr
green "Lancement de Dolibarr"
sudo docker run --rm -d \
    --name dolibarr_aa \
    -p 8080:80 \
    --env DOLI_DB_TYPE=mysqli \
    --env DOLI_DB_HOST=172.19.0.2 \
    --env DOLI_DB_NAME=dolibarr \
    --env DOLI_DB_PORT=3306 \
    --env DOLI_DB_USER=root \
    --env DOLI_DB_PASSWORD=root \
    --env DOLI_MODULES=modSociete \
    --env DOLI_ADMIN_LOGIN=admin \
    --env DOLI_ADMIN_PASSWORD=dolibarr \
    --env APACHE_SERVER_NAME=localhost \
    --network sae \
    upshift/dolibarr

