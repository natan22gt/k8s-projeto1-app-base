#!/bin/bash

USER='natan4dev'

echo $USER
echo "building images"

docker build -t $USER/php-backend:1.0 backend/
docker build -t $USER/mysql-database:1.0 database/

echo "Pushing to docker hub"

docker push $USER/mysql-database:1.0
docker push $USER/php-backend:1.0

echo "criando os deployments e os services"

kubectl apply -f ./services.yml
kubectl apply -f ./deployment.yml