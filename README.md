# bash-test
A small bash test framework.

## Installation

```bash
wget raw.githubusercontent.com/cogwizzle/bash-test/main/install.sh -O - | bash
```

## Updating
```bash
cd vendor/bash-test ; git pull ; cd ../..
```

## Usage
```bash
#!/bin/bash

source ./vendor/bash-test/bash-test.sh

function one_is_one() {
    assert_equal 1 1
}
run_test "A test" one_is_one
```
