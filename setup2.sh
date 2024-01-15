#!/bin/bash

##############################
# Docker configuration setup #
##############################

# Prompt the user for a username
echo "Please enter your username:"
read USERNAME

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
      - ./nginx/frontend/site1:/var/www/site1
    restart: unless-stopped
  nodejs-app1:
    build: /home/user1/site1:/usr/src/app
    env_file: 
      - /home/user1/site1/.env
    depends_on:
      - mysql-db1
  mysql-db1:
    image: mysql:latest
    env_file: 
      - /home/user1/site1/.env
    volumes:
      - /home/user1/site1/mysql-data:/var/lib/mysql
EOF
)

# Create the nginx directory volume if it doesn't exist
sudo mkdir -p /home/${USERNAME}/nginx/
sudo mv nginx.conf /home/${USERNAME}/nginx/

# Create the front end sites directory if it doesn't exist
# You can git clone into the front end folder to create new projects
# frontend/app1 frontend/app2 etc 
sudo mkdir -p /home/${USERNAME}/nginx/frontend/site1
sudo mkdir -p /home/${USERNAME}/nginx/frontend/site2
sudo mkdir -p /home/${USERNAME}/nginx/frontend/site3

# Move addSite.sh and nodeJS.sh to the home directory assuming this repo was downloaded to the home directory
sudo chmod +x addSite.sh
sudo mv addSite.sh /home/${USERNAME}/addSite.sh

sudo chmod +x addNodejs.sh
sudo mv addNodejs.sh /home/${USERNAME}/addNodejs.sh

# Create the database directory if it doesn't exist
sudo mkdir -p /home/user1/site1/mysql-data
sudo mkdir -p /home/user2/site2/mysql-data
sudo mkdir -p /home/user3/site3/mysql-data

# Create docker-compose.yml in the main user's home directory
echo "$DOCKER_COMPOSE_CONTENT" > "/home/${USERNAME}/docker-compose.yml"

# Ensure the user owns the docker-compose file
sudo chown ${USERNAME}: "/home/${USERNAME}/docker-compose.yml"

echo "Docker configuration setup complete."
echo "You can run addSite.sh in the home directory to add or update sites"
echo "You can run addNodejs.sh in the home directory to add or update the nodejs code"