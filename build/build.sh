#!/usr/bin/env bash

echo "Input: $BASH_SOURCE"

ip=$(minikube ip)

function nginx() {
    result=$(cp -r $(pwd)/code $(pwd)/nginx/code)
    echo "$result"
    result=$(docker build -t appotapay-nginx:latest $(pwd)/nginx/)
    echo "$result"
    result=$(rm -rf $(pwd)/nginx/code)
    echo "$result"
    result=$(minikube image load appotapay-nginx)
    echo "$result"
}

function php() {
    result=$(cp -r $(pwd)/code $(pwd)/php/code)
    echo "$result"
    result=$(docker build -t appotapay-php $(pwd)/php/)
    echo "$result"
    result=$(rm -rf $(pwd)/php/code)
    echo "$result"
    result=$(minikube image load appotapay-php)
    echo "$result"
}

function mariadb() {
    result=$(docker build -t appotapay-mariadb:latest $(pwd)/mariadb/)
    echo "$result"
    result=$(minikube image load appotapay-mariadb)
    echo "$result"
}

function all() {
    nginx
    php
    mariadb
}

function helm() {
    result=$(helm uninstall appotapay)
    echo "$result"
    result=$(helm install appotapay $(pwd)/../)
    echo "$result"
    # result=$(minikube tunnel --alsologtostderr)
    # echo "$result"
}

if [ $1 == "nginx" ]; then
  nginx
elif [ $1 == "php" ]; then
  php
elif [ $1 == "mariadb" ]; then
  mariadb
elif [ $1 == "helm" ]; then
  helm
elif [ $1 == "all" ]; then
  all
fi
