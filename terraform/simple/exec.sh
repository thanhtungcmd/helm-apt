#!/usr/bin/env bash

echo "Input: $1"

if [ $1 == "init" ]; then
  result=$(terraform init)
  echo "$result"
elif [ $1 == "validate" ]; then
  result=$(terraform validate)
  echo "$result"
elif [ $1 == "show" ]; then
  result=$(terraform plan -no-color -out=plan.tfout > plan.txt)
  echo "$result"
elif [ $1 == "apply" ]; then
  result=$(terraform apply -auto-approve)
  echo "$result"
elif [ $1 == "destroy" ]; then
  result=$(terraform destroy -auto-approve)
  echo "$result"
fi