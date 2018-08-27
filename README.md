# rdev-container
Docker container with ace editor

## Build the base image
    cd base-image && sudo docker build -t rdev-base . && cd ..

## Build the image
    sudo docker build -t rdev-container:v1 .

## Build the image (without cache)
    sudo docker build --no-cache -t rdev-container:v1 .

## Running the image
    sudo docker run -p 80:80 -it rdev-container:v1

## Accessing the editor
Open URL in browser: http://localhost/ice/
