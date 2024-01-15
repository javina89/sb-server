#!/bin/bash

# Navigate to the frontend directory
cd ./nginx/frontend

# Function to clone and set up a site
setup_site() {
    local site=$1
    echo "Please enter the Git repository URL for $site:"
    read repo_url

    # Clone the repository into the appropriate folder
    sudo git clone "$repo_url" "$site"

    # Set the necessary permissions and ownership
    # Add other setup steps here if needed
}

# Prompt for updating site1
echo "Do you want to update site1? (yes/no)"
read update_site1
if [ "$update_site1" = "yes" ]; then
    setup_site "site1"
fi

# Prompt for updating site2
echo "Do you want to update site2? (yes/no)"
read update_site2
if [ "$update_site2" = "yes" ]; then
    setup_site "site2"
fi

# Prompt for updating site3
echo "Do you want to update site3? (yes/no)"
read update_site3
if [ "$update_site3" = "yes" ]; then
    setup_site "site3"
fi

# Check if frontend.sh exists
if [ -f "./frontend.sh" ]; then
    echo "Setting frontend.sh as executable and running it..."

    # Make frontend.sh executable
    sudo chmod +x ./frontend.sh

    # Run frontend.sh
    ./

echo "Site update process complete."
