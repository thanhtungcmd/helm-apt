#!/usr/bin/env bash

function curl_with_code {

  code=0
  # Run curl in a separate command, capturing output of -w "%{http_code}" into statuscode
  # and sending the content to a file with -o >(cat >/tmp/curl_body)
  statuscode=$(curl -w "%{http_code}" \
    -o /dev/null \
    -s \
    "$@"
  ) || code="$?"

  echo "statuscode : $statuscode"
}

while true; 
do 
  curl_with_code $@; 
  sleep 1; 
done
