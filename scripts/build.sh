#!/bin/bash

filename=build/ultimate-custom-doom-$(git describe --abbrev=0 --tags).pk3

mkdir -p build
scripts/make_changelog.sh
scripts/make_version.sh
rm  -f "$filename"
zip -R "$filename" "*.ogg" "*.png" "*.zs" "*.md" "*.txt"
gzdoom "$filename" "$@" > output 2>&1; cat output
