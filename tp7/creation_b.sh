while IFS=';' read v_nom v_password
do
	echo "nom=$v_nom passwd=$v_passwd"
	sudo adduser --disabled-password --ingroup tptest --gecos "" $v_nom
	echo $v_nom:passwd=$(date +%s | sha256sum | head -c 8) | chpasswd 
done < liste3.txt
