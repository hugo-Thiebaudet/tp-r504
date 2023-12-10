#!/bin/bash

# Nom des images
MYSQL_IMAGE="im_mysql"
DOLIBARR_IMAGE="im_dolibarr"

# Vérifier si l'image MySQL existe
if docker images "$MYSQL_IMAGE" | grep "$MYSQL_IMAGE" > /dev/null; then
    echo "L'image $MYSQL_IMAGE est déjà présente."
else
    # Construire l'image MySQL
    echo "Construction de l'image $MYSQL_IMAGE..."
    docker build -t "$MYSQL_IMAGE" -f Dockerfile .
    sleep 5  # Pause de 5 secondes (ajoutez si nécessaire)
fi

# Vérifier si l'image Dolibarr existe
if docker images "$DOLIBARR_IMAGE" | grep "$DOLIBARR_IMAGE" > /dev/null; then
    echo "L'image $DOLIBARR_IMAGE est déjà présente."
else
    # Construire l'image Dolibarr
    echo "Construction de l'image $DOLIBARR_IMAGE..."
    docker build -t "$DOLIBARR_IMAGE" -f Dockerfile1 .
    sleep 5  # Pause de 5 secondes (ajoutez si nécessaire)
fi

