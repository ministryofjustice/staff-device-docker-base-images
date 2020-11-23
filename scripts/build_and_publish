#!/bin/bash

set -euo pipefail

cd ./images 

for image_name in * ; do
  docker build -t $image_name ./$image_name
  repository_url=${SHARED_SERVICES_ACCOUNT_ID}.dkr.ecr.eu-west-2.amazonaws.com/$image_name
  aws ecr get-login-password | docker login --username AWS --password-stdin ${repository_url}
  docker tag $image_name:latest ${repository_url}:latest
  docker push ${repository_url}:latest  
done
