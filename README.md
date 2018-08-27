# rdev-container
This is a Docker container with [ICECoder](https://icecoder.net/) installed as isolated IDE Environment.
Just build the base image, then the main image and start it.
You are ready to develop with the [ICECoder Browser IDE](https://icecoder.net/).

The idea was to migrate away from cloud9 and still have isolated development environments as containers.
Docker seemed the right choice for this task and [ICECoder](https://icecoder.net/) looked nice with minimal dependencies.

## Quickstart
Build base image and image in one command and then run it

    sudo ./build.sh && sudo docker run -p 80:80 -d rdev-container

## Build the base image
    cd base-image && sudo docker build -t rdev-base . && cd ..

## Build the image
    sudo docker build -t rdev-container .

## Build the image (without cache)
    sudo docker build --no-cache -t rdev-container .

## Running the image
    sudo docker run -p 80:80 -d rdev-container

## Where to put your code / project folder?
Put your code under `/var/www/` in the docker container.
I use a subfolder called "project" (`/var/www/project`) and mount it as volume.

## Accessing the docker image if needed (i.e. for logs)
First get the ID of your container with:

    sudo docker ps

Then access it via (use your container ID):

    sudo docker exec -it a5e5b3bade7c /bin/bash

## Accessing the editor
Open URL in browser: http://localhost/ice/
