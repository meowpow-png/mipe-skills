#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-not-published.sh <bundle> <version>" >&2
	echo "  requires REGISTRY in the environment" >&2
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi

bundle="$1"
version="$2"

ref="${REGISTRY}/${bundle}:${version}"
if oras manifest fetch "$ref" >/dev/null 2>&1; then
	echo "ERROR: ${ref} is already published" >&2
	exit 1
fi
