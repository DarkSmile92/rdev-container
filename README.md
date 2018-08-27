# rdev-container
Docker container with ace editor

## Build the base image
    cd base-image && sudo docker build -t rdev-base . && cd ..

## Build the image
    sudo docker build -t rdev-container .

## Build the image (without cache)
    sudo docker build --no-cache -t rdev-container .

## Running the image
    sudo docker run -p 80:80 -d rdev-container

## Accessing the editor
Open URL in browser: http://localhost/ice/
