#!/bin/bash

# This script creates a ZScript class with mod information.

version=$(git describe --abbrev=0 --tags)
target=zscript/cd_ultimate_custom_doom.zs

cat zscript/cd_ultimate_custom_doom_template.zs > $target
sed -i "s/{VERSION}/$version/" $target
