set +x
noms=$(cat liste1.txt)

for i in $noms; do
	echo "userdel  \"$i\""
	echo "L'utilisateur $i à été supprimé"
done
