#!/bin/bash

#####################
# Environment setup #
#####################

# EDIT HERE
USER1="user_site1"
USER2="user_site2"
USER3="user_site3"

SITE1="your_site1"
SITE2="your_site2"
SITE3="your_site3"

# Create .env files for each site
sudo touch "/home/$USER1/$SITE1/.env"
sudo touch "/home/$USER2/$SITE2/.env"
sudo touch "/home/$USER3/$SITE3/.env"

# Set permissions for .env files
sudo chmod 600 "/home/$USER1/$SITE1/.env"
sudo chmod 600 "/home/$USER2/$SITE2/.env"
sudo chmod 600 "/home/$USER3/$SITE3/.env"

echo "Environment files setup complete."
