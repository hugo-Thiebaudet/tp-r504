options=("Vérifier l'existence d'un utilisateur" "Connaître l'UID d'un utilisateur" "Quitter")
    echo "Sélectionnez une option:"
    select opt in "${options[@]}"; do
        case $opt in
            "Vérifier l'existence d'un utilisateur")
                read -p "Nom d'utilisateur à vérifier : " username
                if id "$username" >/dev/null 2>&1; then
                    echo "L'utilisateur $username existe."
                else
                    echo "L'utilisateur $username n'existe pas."
                fi
                ;;
            "Connaître l'UID d'un utilisateur")
                read -p "Nom d'utilisateur pour connaître l'UID : " username
                uid=$(id -u "$username" 2>/dev/null)
                if [ -n "$uid" ]; then
                    echo "L'UID de l'utilisateur $username est $uid."
                else
                    echo "L'utilisateur $username n'existe pas."
                fi
                ;;
            "Quitter")
                echo "Au revoir !"
                exit 0
                ;;
            *) 
                echo "Choix invalide. Veuillez sélectionner à nouveau."
                ;;
        esac
        PS3="Choisissez une option : "
    done
done

