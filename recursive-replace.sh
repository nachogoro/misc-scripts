#!/bin/bash

# Recursively replace the literal string passed as first parameter for the
# literal string passed as second parameter. It makes use of ag to prevent
# delving into forbidden directories.

ESCAPED_ORIGINAL=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<<"$1")
ESCAPED_NEW=$(sed 's/[&/\]/\\&/g' <<< "$2")
ag -lQ "$1" | xargs sed -i "s/$ESCAPED_ORIGINAL/$ESCAPED_NEW/g"
