#!/bin/bash
set -e

# Install composer.json
if [ "supervisord" == "$(basename $1)" ]; then
  composer install
fi

exec "$@"