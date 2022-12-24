#!/bin/bash

echo "Criando as imagens projeto-backend e projeto-database"

docker build . -t alexandrepedrosofernandes/projeto-backend:1.0
docker build . -t alexandrepedrosofernandes/projeto-database:1.0

echo "Realizando o push das imagens projeto-backend e projeto-database"

docker push  alexandrepedrosofernandes/projeto-backend:1.0
docker push  alexandrepedrosofernandes/projeto-database:1.0

echo "Criando os servicos no Cluster "

kubectl apply -f ./services.yml

echo "Realizando deployment no Cluster "

kubectl apply -f ./deployment.yml
