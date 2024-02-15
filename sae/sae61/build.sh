#!/bin/bash

# Construire les images Docker
docker build -t web_flask -f Dockerfile1 .
docker build -t db_mysql -f Dockerfile2 .

# Lancer les conteneurs avec Docker Compose
docker-compose up -d

