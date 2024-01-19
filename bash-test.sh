#!/bin/bash

_TEST_FAILED=0

# A bash test module.
# 0.1.0

# Asserts two values are equal.
#
# @param left The left value.
# @param right The right value.
#
# @return true if the values are equal, false otherwise.
function assert_equal() {
    local left=$1
    local right=$2
    if [ "$left" != "$right" ]; then
        echo "Left ($left) is not equal to right ($right)." >> /dev/stderr
        echo false
        return 1
    fi
    echo true
    return 0
}

# Asserts two values are not equal.
#
# @param left The left value.
# @param right The right value.
#
# @return true if the values are not equal, false otherwise.
function assert_not_equal() {
    local left=$1
    local right=$2
    if [ "$left" == "$right" ]; then
        echo "Left ($left) is equal to right ($right)." >> /dev/stderr
        echo false
        return 1
    fi
    echo true
    return 0
}

# Test runner function.
#
# Takes a message and a callback function. If an assertion fails the message
# the test should fail.
#
# @param message The message to display.
# @param callback The callback function to run.
#
# @return true if the test passes, false otherwise.
function run_test() {
    local message=$1
    local callback=$2
    local result

    # if before each function is defined run it.
    if [ "$(type -t before_each)" == "function" ]; then
        before_each
    fi

    result=$($callback)

    # if after each function is defined run it.
    if [ "$(type -t after_each)" == "function" ]; then
        after_each
    fi

    # if result contains false
    if [[ $result == *"false"* ]]; then
        _TEST_FAILED=1
        echo "FAIL: $message"
        return 1
    fi
    echo "PASS: $message"
    return 0
}

# Test group runner function.
#
# NOTE: You can not nest groups.
#
# @param message The message to display.
# @param callback The callback function to run.
#
# @return output from the callback function indented.
group() {
    local message=$1
    local callback=$2

    echo "$message:"
    # Add four spaces to all output from the callback.
    $callback | sed 's/^/    /g'
}

# Internal test function that runs after all test have been run.
function _afterInternal() {
    if [ "$(type -t after)" == "function" ]; then
        after
    fi
    return $_TEST_FAILED
}

# On exit run the after cleanup function.
trap "exit" _afterInternal

export -f assert_equal
export -f assert_not_equal
export -f group
export -f run_test
export -f _afterInternal
