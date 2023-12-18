#!/bin/bash
# Récupère le chemin absolu depuis les arguments
chemin_absolu="$1"

# Sépare le chemin en composants en utilisant '/'
IFS='/' read -ra chemins <<< "$chemin_absolu"

# Initialise une variable pour construire le chemin progressivement
chemin_partiel="/"

# Boucle à travers les composants du chemin
for dossier in "${chemins[@]}"; do
    # Vérifie si le chemin partiel se termine par une barre oblique
    if [ "${chemin_partiel: -1}" != "/" ]; then
        chemin_partiel="$chemin_partiel/"
    fi

    chemin_partiel="$chemin_partiel$dossier"

    # Vérifie l'existence du dossier
    if [ ! -d "$chemin_partiel" ]; then
        echo "Chemin invalide, le dossier $dossier n'existe pas dans $chemin_partiel"
        exit 1
    fi
done

# Si la boucle se termine sans problème, le chemin est valide
echo "Chemin valide"
exit 0

