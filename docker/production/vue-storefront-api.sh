#!/bin/sh
set -e

yarn install || exit $?

if [ "$VS_ENV" = 'dev' ]; then
  yarn dev
else
  yarn build
  yarn start
fi
