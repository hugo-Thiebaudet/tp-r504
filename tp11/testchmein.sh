# Vérifie le nombre d'arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <chemin_absolu>"
    exit 1
fi

# Vérifie l'existence de chaque dossier dans le chemin
IFS='/' read -ra chemins <<< "$1"
chemin_partiel="/"

for dossier in "${chemins[@]}"; do
    chemin_partiel="$chemin_partiel$dossier/"

    if [ ! -d "$chemin_partiel" ]; then
        echo "Chemin invalide, le dossier $dossier n'existe pas dans $chemin_partiel"
        exit 1
    fi
done

echo "Chemin valide"
exit 0

