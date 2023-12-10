FROM mysql:latest

#Exposition du port
EXPOSE 3306

#Mot de passe
ENV MYSQL_ROOT_PASSWORD=root

#COPY init.sql /docker-entrypoint-initdb.d/
COPY my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]
