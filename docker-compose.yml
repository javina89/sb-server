#!/bin/bash

# Replace these with the actual values or ways to obtain them
USERNAME="your_username"
SITE1="your_site1"
SITE2="your_site2"
SITE3="your_site3"
DOCKER_COMPOSE_CONTENT=$(cat <<EOF
version: '3.8'
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      -  "/home/${USERNAME}/sites:/home/${USERNAME}/sites"
    env_file:
      - /etc/nginx-cred/myenv.env
    restart: unless-stopped
EOF
)

# Create nginx-cred directory if it doesn't exist
sudo mkdir -p /etc/nginx-cred

# Add variables to /etc/environment
echo "USERNAME=$USERNAME" | sudo tee -a /etc/environment
echo "SITE1=$SITE1" | sudo tee -a /etc/environment
echo "SITE2=$SITE2" | sudo tee -a /etc/environment
echo "SITE3=$SITE3" | sudo tee -a /etc/environment

# Add variables to /etc/nginx-cred/myenv.env
echo "USERNAME=$USERNAME" | sudo tee /etc/nginx-cred/myenv.env
echo "SITE1=$SITE1" | sudo tee -a /etc/nginx-cred/myenv.env
echo "SITE2=$SITE2" | sudo tee -a /etc/nginx-cred/myenv.env
echo "SITE3=$SITE3" | sudo tee -a /etc/nginx-cred/myenv.env

# Create sites directory if it doesn't exist
mkdir -p "/home/${USERNAME}/sites/${SITE1}"
mkdir -p "/home/${USERNAME}/sites/${SITE2}"
mkdir -p "/home/${USERNAME}/sites/${SITE3}"

# Create a blank index.html in the SITE directories
touch "/home/${USERNAME}/sites/${SITE1}/index.html"
touch "/home/${USERNAME}/sites/${SITE2}/index.html"
touch "/home/${USERNAME}/sites/${SITE3}/index.html"

# Set permissions for index.html
sudo chmod 644 /home/${USERNAME}/sites/${SITE1}/index.html
sudo chmod 644 /home/${USERNAME}/sites/${SITE2}/index.html
sudo chmod 644 /home/${USERNAME}/sites/${SITE3}/index.html

# Add docker-compose.yml to the home directory
echo "$DOCKER_COMPOSE_CONTENT" > /home/${USERNAME}/docker-compose.yml
