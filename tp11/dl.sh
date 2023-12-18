#!/bin/bash

# Vérifier si le numéro du strip xkcd est spécifié en argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <numéro_strip_xkcd>"
    exit 1
fi

strip_number="$1"
url="https://xkcd.com/$strip_number/"

# Télécharger la page HTML
wget -q -O xkcd_page.html "$url"

# Extraire l'URL de l'image du source HTML
image_url=$(grep -oP 'meta property="og:image" content="\K[^"]+' xkcd_page.html)

# Vérifier si l'URL de l'image a été trouvée
if [ -n "$image_url" ]; then
    echo "URL de l'image : $image_url"

    # Télécharger l'image
    wget -q -O xkcd_strip.png "$image_url"

    # Afficher l'image avec xdg-open
    xdg-open xkcd_strip.png
else
    echo "Impossible de trouver l'URL de l'image pour le strip xkcd $strip_number."
fi

# Nettoyer les fichiers temporaires
rm -f xkcd_page.html xkcd_strip.png

