#!/bin/bash

###########################
#User and directory setup #
###########################

# Create and set up users for each site
sudo adduser --disabled-login --no-create-home user1
sudo adduser --disabled-login --no-create-home user2
sudo adduser --disabled-login --no-create-home user3

# Create application directories for each site under each user's home directory
sudo mkdir -p "/home/user1/site1"
sudo mkdir -p "/home/user2/site2"
sudo mkdir -p "/home/user3/site3"

# Create .env files for each site
sudo touch "/home/user1/site1/.env"
sudo touch "/home/user2/site2/.env"
sudo touch "/home/user3/site3/.env"

# Set directory ownership
sudo chown -R user1: "/home/user1/site1"
sudo chown -R user2: "/home/user2/site2"
sudo chown -R user3: "/home/user3/site3"

# Set directory permissions
sudo chmod 700 "/home/user1/site1"
sudo chmod 700 "/home/user2/site2"
sudo chmod 700 "/home/user3/site3"

echo "User and directory setup complete."
echo "Please edit your .env file in /home/user1/site1/.env and other directories"
