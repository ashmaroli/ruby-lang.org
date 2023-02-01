#!/usr/bin/env bash

echo "Diff two build destination directories.."
diff -urN --color=always "$@"

exit 0
