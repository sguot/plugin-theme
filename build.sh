#!/usr/bin/env bash

set -u -e -o pipefail

rm -rf dist

TEST=false
for ARG in "$@"; do
  case "$ARG" in
    -t)
      TEST=true
      ;;
  esac
done

$(npm bin)/tsc -d

cp LICENSE dist/LICENSE
cp package.json dist/package.json
cp README.md dist/README.md

if [[ ${TEST} == true ]]; then
  cp -fr dist/* ../ng-alain-themes/node_modules/ng-alain-plugin-theme
fi
