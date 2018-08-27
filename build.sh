#!/bin/sh
cd base-image && sudo docker build -t rdev-base . && cd ..
sudo docker build --no-cache -t rdev-container .