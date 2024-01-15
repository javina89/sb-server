#!/bin/bash

# This script sets up user directories and permissions
# for a multi-user environment

# Prompt for and read the admin username
echo "Please enter your admin username:"
read USERNAME

# Install Access Control List (ACL) package if not already installed
# ACLs provide more fine-grained access control
sudo apt-get install -y acl

# Creating user accounts for three different users
# These users will have directories for their sites
sudo adduser --disabled-login --no-create-home --gecos "" user1
sudo adduser --disabled-login --no-create-home --gecos "" user2
sudo adduser --disabled-login --no-create-home --gecos "" user3

# Creating directories for each user to host their site
# These directories are located in the user's home directory
sudo mkdir -p "/home/user1/site1"
sudo mkdir -p "/home/user2/site2"
sudo mkdir -p "/home/user3/site3"

# Create .env files in each user's site directory
# The .env file is used for storing environment variables
sudo touch "/home/user1/site1/.env"
sudo touch "/home/user2/site2/.env"
sudo touch "/home/user3/site3/.env"

# Set the ownership of .env files to the respective users
# Ensuring that each user can only modify their own .env file
sudo chown user1:user1 "/home/user1/site1/.env"
sudo chown user2:user2 "/home/user2/site2/.env"
sudo chown user3:user3 "/home/user3/site3/.env"

# Set permissions for .env files to be read and write by the owner only
sudo chmod 600 "/home/user1/site1/.env"
sudo chmod 600 "/home/user2/site2/.env"
sudo chmod 600 "/home/user3/site3/.env"

# Set ACL permissions for the .env files to allow 'oem' read and write access
sudo setfacl -m u:oem:rw /home/user1/site1/.env
sudo setfacl -m u:oem:rw /home/user2/site2/.env
sudo setfacl -m u:oem:rw /home/user3/site3/.env

# Set ownership of the site directories to the respective users
# This makes each user the owner of their site directory
sudo chown -R user1:user1 "/home/user1/site1"
sudo chown -R user2:user2 "/home/user2/site2"
sudo chown -R user3:user3 "/home/user3/site3"

# Set permissions for each site directory
# 700 permissions mean the owner can read, write, and execute, but no access for others
sudo chmod 700 "/home/user1/site1"
sudo chmod 700 "/home/user2/site2"
sudo chmod 700 "/home/user3/site3"

# Set ACL permissions to allow the admin user 'oem' read, write, and execute access to each
# user's site directory. This is necessary for administrative tasks.
sudo setfacl -m u:oem:rwx /home/user1/site1
sudo setfacl -m u:oem:rwx /home/user2/site2
sudo setfacl -m u:oem:rwx /home/user3/site3

# Print completion message with a reminder to edit the .env files
echo "User and directory setup complete."
echo "Please edit your .env file in /home/user1/site1/.env and other directories"
