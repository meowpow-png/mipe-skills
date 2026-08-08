#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: create-release.sh <tag> <bundle> <version> <notes-file>" >&2
	echo "  requires GH_TOKEN in the environment" >&2
}

if [ "$#" -ne 4 ]; then
	usage
	exit 1
fi

tag="$1"
bundle="$2"
version="$3"
notes_file="$4"

gh release create "$tag" \
	--title "${bundle} v${version}" \
	--notes-file "$notes_file"
