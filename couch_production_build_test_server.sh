#!/bin/sh
echo -ne '\033c\033]0;couch_production_build_test\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/couch_production_build_test_server.x86_64" "$@"
