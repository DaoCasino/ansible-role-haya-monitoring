#!/bin/bash
set -e

# If on Travis CI, update Docker's configuration.
if [ "$TRAVIS" == "true" ]; then
  mkdir /tmp/docker
  echo '{
    "experimental": true,
    "storage-driver": "vfs"
  }' | sudo tee /etc/docker/daemon.json
  sudo service docker restart
fi
