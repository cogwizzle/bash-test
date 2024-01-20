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

## Require Utility
This project comes built in with a utility that allows you to include bash
files using the relative path. Adoption of this utility should be used in an
all or nothing fashion. Either replace all sources with require or use the base
bash source command.

### Usage
```bash
#!/bin/bash
require ./vendor/bash-test/bash-test.sh
```

### Reason
This utility is important because bash doesn't give you a built in way to
accomplish relative pathing from the current shell file. This small utility
allows you to write bash modules and include them in many different bash files
or bash projects.
