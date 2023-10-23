set +x
#nomecho "noms=$noms"
#exits=$(cat liste1.txt)



groupadd tptest

for i in $noms;do
	echo "adduser --disabled-password --gecos \"$i\""
#    usermod -aG tptest \"$i\"
#		echo "L utilisateur $i à été ccrée et ajouté au groupe tptest"
done
