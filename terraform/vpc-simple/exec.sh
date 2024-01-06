#!/usr/bin/env bash

echo "Input: $1"

if [ $1 == "init" ]; then
  result=$(terraform init)
  echo "$result"
elif [ $1 == "validate" ]; then
  result=$(terraform validate)
  echo "$result"
elif [ $1 == "show" ]; then
  result=$(terraform plan -out=plan.tfout)
  result=$(terraform show -no-color plan.tfout > plan.txt)
  echo "$result"
elif [ $1 == "apply" ]; then
  result=$(terraform apply)
  echo "$result"
fi