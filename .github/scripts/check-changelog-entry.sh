#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-changelog-entry.sh <bundle> <version>" >&2
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi

bundle="$1"
version="$2"

heading="## [${bundle} v${version}]"
if ! grep -qF "$heading" CHANGELOG.md; then
	echo "ERROR: CHANGELOG.md has no '${heading}' entry" >&2
	exit 1
fi
