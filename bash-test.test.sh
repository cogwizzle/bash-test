#!/bin/bash

source ./bash-test.sh

# Test the bash-test.sh script

function assert_equal_pass() {
    assert_equal 1 1
}
test "Assert equal passes when values match." assert_equal_pass

function assert_equal_fail() {
    local result
    result=$(assert_equal 1 2)
    assert_equal "false" "$result"
}
test "Assert equal fails when values do not match." assert_equal_fail

function assert_not_equal_pass() {
    assert_not_equal 1 2
}
test "Assert not equal passes when values do not match." assert_not_equal_pass

function assert_not_equal_fail() {
    local result
    result=$(assert_not_equal 1 1)
    assert_equal "false" "$result"
}
test "Assert not equal fails when values match." assert_not_equal_fail
