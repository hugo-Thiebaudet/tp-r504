if [ "$1" = "" ]
 then 
	n1=5
 else 
	n1=$1
 fi

if [ "$2" = "" ]
 then 
	n2= $(( n1 + 10 ))
 else 
	n2=$2
 fi


# i in { $n1..$n2 }
for (( i=$n1; i=<$n2; i++ ))
do 
	echo "$i"
done
