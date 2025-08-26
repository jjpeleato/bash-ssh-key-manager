#!/bin/bash

# This script initializes the project by setting up necessary configurations and dependencies.
# It should be run once after cloning the repository.
# Usage: ./initialize.sh

ENV_FILE="loki.txt"

# Check if the ENV_FILE exists
if [ -f "$ENV_FILE" ]; then
    echo
    echo "❌ File \"$ENV_FILE\" exists. Aborting initialization."
    echo
    echo "Initialization has already been done. If you want to re-initialize, please delete the file \"$ENV_FILE\" and run this script again."
    echo
    exit 1
else
    echo
    echo "🚀 File \"$ENV_FILE\" does not exist. Performing initialization..."
    echo
    touch "$ENV_FILE"
fi

# How many environments do you want to set up?
echo
echo "Step 1️⃣"
echo
echo "How many environments do you want to set up? (e.g., 1 for personal use, 2 for personal and work, etc.)"
echo "Press ENTER to skip and use the default (1):"
read -r ENV_COUNT
ENV_COUNT=${ENV_COUNT:-1}

# Write environment names to the ENV_FILE
echo
echo "Step 2️⃣"
echo
echo "You have chosen to set up $ENV_COUNT environment(s)."

ENV_NAMES=()
for ((i=1; i<=ENV_COUNT; i++)); do
    echo
    echo "👇 Setting up environment $i..."
    echo
    echo "If you want to use an existing environment, write the exact same name."
    echo "Enter the name for environment $i (e.g., personal, work, client_odin, client_thor, etc):"
    read -r ENV_NAME
    ENV_NAME=${ENV_NAME:-env$i}

    echo
    echo "Environment $i name set to: $ENV_NAME"

    echo "$ENV_NAME" >> $ENV_FILE
    ENV_NAMES+=("$ENV_NAME")
done

# Create directories for each environment
echo
echo "Step 3️⃣"
echo

for ENV_NAME in "${ENV_NAMES[@]}"; do
    ENV_DIR="./$ENV_NAME"
    if [ ! -d "$ENV_DIR" ]; then
        echo "Created directory: $ENV_DIR"
        mkdir -p "$ENV_DIR"
    else
        echo "Directory already exists: $ENV_DIR"
    fi
done
