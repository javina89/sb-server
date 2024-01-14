#!/bin/bash

##############################
# Docker configuration setup #
##############################

# EDIT HERE
USERNAME="your_username"

USER1="user_site1"
USER2="user_site2"
USER3="user_site3"

SITE1="your_site1"
SITE2="your_site2"
SITE3="your_site3"

# Docker Compose configuration
DOCKER_COMPOSE_CONTENT=$(cat <<EOF
version: '3.8'
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
    restart: unless-stopped
  nodejs-app1:
    build: /home/$USER1/$SITE1
    env_file: 
      - /home/$USER1/$SITE1/.env
    depends_on:
      - mysql-db1
  mysql-db1:
    image: mysql:latest
    env_file: 
      - /home/$USER1/$SITE1/.env
    volumes:
      - /home/$USER1/$SITE1/mysql-data:/var/lib/mysql
EOF
)

# Create the nginx directory volume if it doesn't exist
sudo mkdir -p /home/${USERNAME}/nginx/nginx.conf

# Create the front end sites directory if it doesn't exist
# You can git clone into the front end folder to create new projects
# frontend/app1 frontend/app2 etc 
sudo mkdir -p /home/${USERNAME}/nginx/frontend

# Create the database directory if it doesn't exist
sudo mkdir -p /home/$USER1/$SITE1/mysql-data
sudo mkdir -p /home/$USER2/$SITE2/mysql-data
sudo mkdir -p /home/$USER3/$SITE3/mysql-data

# Create docker-compose.yml in the main user's home directory
echo "$DOCKER_COMPOSE_CONTENT" > "/home/${USERNAME}/docker-compose.yml"

# Ensure the user owns the docker-compose file
sudo chown ${USERNAME}: "/home/${USERNAME}/docker-compose.yml"

echo "Docker configuration setup complete."