#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-bundle-exists.sh <bundle>" >&2
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

bundle="$1"

if [ ! -f "bundles/${bundle}.yml" ]; then
	echo "ERROR: bundles/${bundle}.yml not found" >&2
	exit 1
fi
