#!/bin/bash

# Base directory is the current directory
BASE_DIR="./nginx/frontend"

# Navigate to the frontend directory
cd "${BASE_DIR}"

# Function to clone and set up a site
setup_site() {
    local site=$1
    echo "Please enter the frontend code Git repository URL for $site:"
    read repo_url

    local temp_dir="$site/temp_clone"

    # Remove any existing .git directory in the site directory
    sudo rm -rf "$site/.git"

    # Remove the temp_dir if it exists from a previous run
    sudo rm -rf "$temp_dir"

    # Clone the repository into the temp_dir
    git clone "$repo_url" "$temp_dir"

    # Move the cloned content to the site directory
    # Exclude the special directories '.' and '..'
    sudo find "$temp_dir" -mindepth 1 -maxdepth 1 -exec mv {} "$site" \;

    # Remove the now-empty temp directory
    sudo rm -rf "$temp_dir"

    # Navigate back to the base directory
    cd "${BASE_DIR}"
}

# Update process for each site
for site in "site1" "site2" "site3"; do
    echo "Do you want to update $site? (yes/no)"
    read update_site
    if [ "$update_site" = "yes" ]; then
        # Run setup for the chosen site
        setup_site "$site"
    fi
done

echo "Site update process complete."
