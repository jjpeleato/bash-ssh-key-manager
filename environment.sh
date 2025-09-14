#!/bin/bash

#
# This script configures the SSH environment by copying the appropriate SSH key files
# for the specified environment. It first deletes any existing SSH key files, then
# copies the new files from the selected environment directory.
#
# - Unix-based systems only (Linux, macOS)
#

# Define the environment file and files to delete/copy
ENV_FILE="loki.txt"
DELETES=("known_hosts" "known_hosts.old" "id_rsa" "id_rsa.pub" "id_rsa_filezilla.ppk")
KEYS=("id_rsa" "id_rsa.pub" "id_rsa_filezilla.ppk")

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
ENV_NAMES=()
while IFS= read -r ROW; do
    ENV_NAMES+=("$ROW")
done < "$ENV_FILE"

for ENV_NAME in "${ENV_NAMES[@]}"; do
    ENV_DIR="./$ENV_NAME"
    if [ ! -d "$ENV_DIR" ]; then
        echo "Directory did not exist: $ENV_DIR ⚠️  (please re-run initialization script)"
        echo
        echo "❌ Aborting to change environment ❌"
        echo
        exit 1
    fi
done

# Select environment
echo "Step 1️⃣"
echo

echo "Environments:"
echo
for ENV_NAME in "${ENV_NAMES[@]}"; do
    echo "- $ENV_NAME"
done

echo
echo "Write the environment to use:"
read -r ENV_SELECTED

if [[ ! " ${ENV_NAMES[*]} " =~ " ${ENV_SELECTED} " ]]; then
    echo
    echo "❌ Environment \"$ENV_SELECTED\" is not valid. Aborting to change environment."
    echo
    exit 1
else
    echo
    echo "You have selected the environment: $ENV_SELECTED ✅"
fi

# Delete existing SSH key files
echo
echo "Step 2️⃣"
echo

echo "Deleting old files..."
echo
for file in "${DELETES[@]}"; do
    if [ -e "./$file" ]; then
        rm -f "./$file"
        echo "Deleted ./$file ✅"
    else
        echo "./$file does not exist, skipping ⚠️"
    fi
done

# Copy new SSH key files from the selected environment directory
echo
echo "Step 3️⃣"
echo

echo "Copying new files from environment \"$ENV_SELECTED\"..."
echo
for file in "${KEYS[@]}"; do
    if [ -e "./$ENV_SELECTED/$file" ]; then
        cp "./$ENV_SELECTED/$file" "."
        echo "Copied ./$ENV_SELECTED/$file to ./$file ✅"
    else
        echo "./$ENV_SELECTED/$file does not exist, skipping ⚠️"
    fi
done

echo
echo "🎉 Change environment successfully! 🎉"
echo
