#!/bin/bash

# Function to clone and set up a site
setup_site() {
    local site_dir=$1
    echo "Please enter the nodeJS Git repository URL for $site_dir:"
    read repo_url

    # Temporary folder for cloning
    local temp_dir="temp_clone"

    # Ensure the site directory exists
    if [ ! -d "$site_dir" ]; then
        echo "Directory $site_dir does not exist. Creating it now."
        sudo mkdir -p "$site_dir"
        # Optionally set owner and permissions here
    fi

    # Clone the repository into a temporary folder
    git clone "$repo_url" "$temp_dir"

    # Move the cloned content to the site directory and remove the temp directory
    mv "$temp_dir"/* "$temp_dir"/.git* "$site_dir"
    rm -rf "$temp_dir"

    # Set the necessary permissions and ownership
    # Add other setup steps here if needed
}

# Update process for each user's site
for user in "user1" "user2" "user3"; do
    echo "Do you want to update ${user}'s site? (yes/no)"
    read update_site
    if [ "$update_site" = "yes" ]; then
        # Run setup for the chosen site
        setup_site "/home/$user/${user}site"
    fi
done

echo "Nodejs site update process complete."