#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <repo name to clone>"
    exit 1
fi

thisrep=$(git config --get remote.origin.url)
allreps=$(dirname "$thisrep")
git clone "${allreps}/$1"
