#!/bin/sh -e

xcconfig=$(mktemp /tmp/static.xcconfig.mindstrong)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

echo "LD = $PWD/Scripts/ld.py" >> $xcconfig
echo "DEBUG_INFORMATION_FORMAT = dwarf" >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"

carthage build "$@"
