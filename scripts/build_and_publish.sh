#!/bin/bash

set -euo pipefail

cd ./images 

for image_name in * ; do
  docker build -t $image_name ./$image_name
  tag=$( < $image_name/Dockerfile cut -f2 -d ' ' | sed 's/[^a-zA-Z0-9]/-/g' )
  repository_url=${SHARED_SERVICES_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com/$image_name
  aws ecr get-login-password | docker login --username AWS --password-stdin ${repository_url}
  docker tag $image_name ${repository_url}:$tag
  docker push ${repository_url}:$tag  
  docker tag $image_name ${repository_url}:latest
  docker push ${repository_url}:latest
done
