#!/bin/bash

###########################
#User and directory setup #
###########################

# EDIT HERE
USER1="user_site1"
USER2="user_site2"
USER3="user_site3"

SITE1="your_site1"
SITE2="your_site2"
SITE3="your_site3"

# Create and set up users for each site
sudo adduser --disabled-login --no-create-home $USER1
sudo adduser --disabled-login --no-create-home $USER2
sudo adduser --disabled-login --no-create-home $USER3

# Create application directories for each site under each user's home directory
sudo mkdir -p "/home/$USER1/$SITE1"
sudo mkdir -p "/home/$USER2/$SITE2"
sudo mkdir -p "/home/$USER3/$SITE3"

# Set directory ownership
sudo chown -R $USER1: "/home/$USER1/$SITE1"
sudo chown -R $USER2: "/home/$USER2/$SITE2"
sudo chown -R $USER3: "/home/$USER3/$SITE3"

# Set directory permissions
sudo chmod 700 "/home/$USER1/$SITE1"
sudo chmod 700 "/home/$USER2/$SITE2"
sudo chmod 700 "/home/$USER3/$SITE3"

echo "User and directory setup complete."
