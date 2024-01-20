#!/bin/bash

# Testing the require utility. This test requires that `require` is globally
# installed or globally symbolically linked.

require "test.sh" || exit 1

function on_exit() {
    # If exit code is 0, then the test passed.
    if [ $? -eq 0 ]; then
        echo "Test passed."
    else
        echo "Test failed."
    fi
}

trap on_exit EXIT

