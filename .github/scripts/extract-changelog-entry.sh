#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: extract-changelog-entry.sh <bundle> <version>" >&2
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi

bundle="$1"
version="$2"

awk -v prefix="## [${bundle} v${version}]" '
	index($0, prefix) == 1 { found=1; next }
	found && index($0, "## [") == 1 { exit }
	found { print }
' CHANGELOG.md
