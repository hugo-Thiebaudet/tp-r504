#!/bin/bash

# Fonction pour afficher du texte en vert
print_green() {
    echo -e "\e[32m$1\e[0m"
}

while true; do
    # Afficher le menu
    echo "Sélectionnez :"
    PS3="Votre choix : "
    options=("Vérifier l’existence d’un utilisateur" "Connaître l’UID d’un utilisateur" "Quitter")

    # Afficher les options avec la commande select
    select opt in "${options[@]}"; do
        case $REPLY in
            1)
                # Vérifier l'existence d'un utilisateur
                read -p "Nom d'utilisateur à vérifier : " username
                if grep  "^$username:" /etc/passwd; then
                    print_green "L'utilisateur $username existe."
                else
                    print_green "L'utilisateur $username n'existe pas."
                fi
                break
                ;;
            2)
                # Connaître l'UID d'un utilisateur
                read -p "Nom d'utilisateur pour connaître l'UID : " nomutilisateur
				#Obtenir l'IUD de l'utilisateur spécifié 
                uid=$(id -u "$nomutilisateur" 2>/dev/null) 
				# Tester si L'utilisateur existe & si la chaine n'est pas nul
                if [ -n "$uid" ]; then
                    print_green "L'UID de l'utilisateur $nomutilisateur est $uid."
                else
                    print_green "L'utilisateur $nomutilisateur n'existe pas."
                fi
                break
                ;;
            3)
                # Quitter le script
                print_green "Au revoir !"
                exit 0
                ;;
            *)
                # Pour les choix invalides
                print_green "Choix invalide. Veuillez sélectionner à nouveau."
                ;;
        esac
    done
done

