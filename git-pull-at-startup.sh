#!/bin/bash

# Define Git repositories to be updated; multiple URLs are allowed ('URL1' 'URL2').
REPOSITORIES=("https://github.com/Maik-Wi/git-pull-at-startup")

# Function to check internet connection
check_internet_connection() {
    local timeout=120  # Timeout in seconds
    local start_time=$(date +%s)
    local end_time=$((start_time + timeout))

    while [ $(date +%s) -lt $end_time ]; do
        if ping -c 1 8.8.8.8 &> /dev/null; then
            return 0  # Internet connection is available
        fi
        sleep 5  # Wait 5 seconds before trying again
    done

    return 1  # Internet connection is not available within timeout
}

# Function to update Git repositories
update_repositories() {
    for repo in "${REPOSITORIES[@]}"; do
        echo "Updating $repo ..."
        git -C "$(basename "$repo" .git)" pull
    done
}

# Main function
main() {
    echo "Checking internet connection ..."
    if check_internet_connection; then
        echo "Internet connection available. Updating Git repositories ..."
        update_repositories
        echo "Git repositories updated successfully."
        notify-send -u normal "Git repositories updated successfully."
    else
        echo "Internet connection not available within 2 minutes. Skipping repository updates."
        notify-send -u normal "Internet connection not available within 2 minutes. Skipping repository updates."
    fi
}

# Call the main function
main
