#!/bin/bash

docker build --tag devopstask-db:latest . && 
docker build --tag devopstask-server:latest ./php_server &&
docker compose up -d
