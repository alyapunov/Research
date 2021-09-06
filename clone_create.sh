#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <repo name to clone>"
    exit 1
fi

./clone.sh $1 && cd $1 && ../create.sh
