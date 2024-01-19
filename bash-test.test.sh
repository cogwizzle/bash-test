#!/bin/bash

source ./bash-test.sh

# Test the bash-test.sh script

function before_each() {
    echo "before_each"
}

function after_each() {
    echo "after_each"
}

function after() {
    echo "after"
}

function assert_equal_pass() {
    assert_equal 1 1
}
run_test "Assert equal passes when values match." assert_equal_pass

function assert_equal_fail() {
    local result
    result=$(assert_equal 1 2)
    assert_equal "false" "$result"
}
run_test "Assert equal fails when values do not match." assert_equal_fail

function assert_not_equal_pass() {
    assert_not_equal 1 2
}
run_test "Assert not equal passes when values do not match." assert_not_equal_pass

function assert_not_equal_fail() {
    local result
    result=$(assert_not_equal 1 1)
    assert_equal "false" "$result"
}
run_test "Assert not equal fails when values match." assert_not_equal_fail

function group_test() {
    function before_each() {
        return 0
    }
    function after_each() {
        return 0
    }
    run_test "Assert equal passes when values match." assert_equal_pass
    run_test "Assert equal fails when values do not match." assert_equal_fail
}
group "Group test" group_test
