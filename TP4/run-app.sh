docker network inspect net-tp4 >/dev/null 2>&1 || docker network create net-tp4

# Lancer le conteneur "tp4-app" à partir de l'image "im-tp4"
docker run -d --name tp4-app --network net-tp4 -p 5000:5000 im-tp4
