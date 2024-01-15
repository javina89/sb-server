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

    # Clone the repository into the appropriate folder
    sudo git clone "$repo_url" "$site"

    # Process the cloned directory
    process_site_dir "$site"
}

# Function to process a site directory
process_site_dir() {
    local site_dir=$1
    echo "Processing ${site_dir}..."

    # Navigate to the site directory
    cd "${site_dir}"

    # Find the first directory (assuming it's the cloned Git repo)
    local repo_dir=$(find . -maxdepth 1 -type d | sed '1!d' | sed 's|./||')

    if [ -n "$repo_dir" ]; then
        echo "Found repo directory: $repo_dir"

        # Move all files and directories from the repo directory to the site directory
        mv "${repo_dir}"/* .

        # Remove the now-empty repo directory
        rm -rf "${repo_dir}"
        echo "Moved files and deleted ${repo_dir}."
    else
        echo "No repo directory found in ${site_dir}"
    fi

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
