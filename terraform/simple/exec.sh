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
  echo "$result"
  result=$(terraform show -no-color plan.tfout > plan.txt)
  echo "$result"
elif [ $1 == "apply" ]; then
  result=$(terraform apply)
  echo "$result"
elif [ $1 == "destroy" ]; then
  result=$(terraform destroy)
  echo "$result"
fi