docker build -t im-nginx-lb .
mkdir -p shared1 shared2

touch shared1/index.html
touch shared2/index.html

echo "<h1>Hello1</h1>" >  shared1/index.html
echo "<h2>Hello2</h2>" >  shared2/index.html

docker run -d --name nginx1 -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx
docker run -d --name nginx2 -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx

docker run -d --name im-nginx-lb -p 83:80 im-nginx-lb
