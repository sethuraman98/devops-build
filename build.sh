#!/bin/bash

IMAGE_NAME=sethu336/dev:latest

docker build -t $IMAGE_NAME .

docker push $IMAGE_NAME
