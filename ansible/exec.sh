#!/usr/bin/env bash

echo "Input: $1"

if [ $1 == "simple" ]; then
  result=$(ansible-playbook -i inventory task.yaml)
  echo "$result"
elif [ $1 == "iptable" ]; then
  result=$(ansible-playbook -i inventory iptable.yaml)
  echo "$result"
fi