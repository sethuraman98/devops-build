#!/bin/bash

docker pull sethu336/dev:latest

docker stop react-container || true
docker rm react-container || true

docker run -d \
  --name react-container \
  -p 80:80 \
  sethu336/dev:latest
