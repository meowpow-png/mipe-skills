#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-version-format.sh <version>" >&2
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

version="$1"

if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	echo "ERROR: '${version}' is not a valid X.Y.Z version" >&2
	exit 1
fi
