#!/bin/bash

docker build --tag devopstask-db:latest . && docker compose up -d
