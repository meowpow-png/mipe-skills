#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: manifest-version.sh [manifest-file]" >&2
	echo "  reads from stdin if no file is given" >&2
}

if [ "$#" -gt 1 ]; then
	usage
	exit 1
fi

grep -E '^version:[[:space:]]*' "$@" | sed -E 's/^version:[[:space:]]*//; s/[[:space:]]+$//'
