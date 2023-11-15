count_nginx1=0
count_nginx2=0

for i in {1..100}
do curl localhost:83 
done

a=$(curl http://localhost:83)
if ["$a"="<h1>Hello1<h1>"]
then ((count_nginx1++))

else ((count_nginx2++))

echo "requête sur nginx1 : $count_nginx1"
echo "requête sur nginx2 : $count_nginx2"
