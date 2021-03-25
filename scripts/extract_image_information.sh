#!/bin/bash

set -e

echo "" > prometheus_metrics/docker_image_versions.txt

for d in images/*/; do

info=$(cat $d/Dockerfile | grep FROM | cut -d M -f2)

imagesName=$(echo $info | cut -d : -f1)
imageVersion=$(echo $info | cut -d : -f2)

echo "docker_image_versions{imageName=\"${imagesName}\",imageVersion=\"${imageVersion}\"} 1" >> prometheus_metrics/docker_image_versions.txt

done

cat prometheus_metrics/docker_image_versions.txt