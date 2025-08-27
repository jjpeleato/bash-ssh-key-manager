#!/bin/bash

#
# This script configures the SSH environment by copying the appropriate SSH key files
# for the specified environment. It first deletes any existing SSH key files, then
# copies the new files from the selected environment directory.
#

# Define the SSH directory and files
ENV_FILE="loki.txt"

# Check if the ENV_FILE exists
if [ ! -f "$ENV_FILE" ]; then
    echo
    echo "❌ File \"$ENV_FILE\" does not exists. Aborting to change environment."
    echo
    echo "Please run the initialization script first: ./initialize.sh"
    echo
    exit 1
else
    echo
    echo "🚀 Starting to change environment... 🚀"
    echo
fi

# Read environments from the ENV_FILE
echo
echo "Step 1️⃣"
echo

ENV_NAMES=()
while IFS= read -r ROW; do
    ENV_NAMES+=("$ROW")
    echo "Load \"$ROW\" environment ✅"
done < "$ENV_FILE"

# Display available environments
echo
echo "Step 2️⃣"
echo

for ENV_NAME in "${ENV_NAMES[@]}"; do
    ENV_DIR="./$ENV_NAME"
    if [ ! -d "$ENV_DIR" ]; then
        echo "Directory did not exist: $ENV_DIR ⚠️  (please re-run initialization script)"
        echo
        echo
        echo "❌ Aborting to change environment ❌"
        echo
        exit 1
    else
        echo "$ENV_DIR directory exists ✅"
    fi
done

echo
echo "🎉 Change environment successfully! 🎉"
echo
