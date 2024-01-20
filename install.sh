#!/bin/bash

# Check for the dependencies
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' > /dev/stderr
  exit 1
fi

# Download the source code to vendor folder in the current directory
mkdir -p vendor
git clone https://github.com/cogwizzle/bash-test.git vendor/bash-test

# Add require to global command list
sudo ln -s "$(pwd)/vendor/bash-test/require" "/usr/local/bin/require"
