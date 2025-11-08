#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Requires a image name"
    exit 1
fi

butane="$1.butane"
if [ ! -f "$butane" ]; then
    echo "$butane could not be found"
    exit 1
fi 

podman run -i --rm --security-opt label=disable --volume $(pwd):/pwd --workdir /pwd quay.io/coreos/butane:release --pretty --strict --files-dir /pwd "$butane" > "$1.ign"

python3 -m http.server
