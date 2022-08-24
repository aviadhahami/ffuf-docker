#!/bin/bash

# set -ex;

TAG="tools:ffuf"

docker build -t $TAG .
echo -e "[+] Done building! run with: 'docker run -it $TAG /bin/bash'\r\n"