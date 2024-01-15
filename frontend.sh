#!/bin/bash

# Base directory is the current directory
BASE_DIR="."

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

# Process each site directory
process_site_dir "site1"
process_site_dir "site2"
process_site_dir "site3"
