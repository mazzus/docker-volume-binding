#!/bin/sh

docker build -t docker-volume-binding .
# Readonly at the end can be removed if you want the container to be able to change the files of the host
docker run --mount type=bind,source="$(pwd)/src,target=/src,readonly" \
  --rm -it docker-volume-binding