#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-version-matches-manifest.sh <bundle> <version>" >&2
}

if [ "$#" -ne 2 ]; then
	usage
	exit 1
fi

bundle="$1"
version="$2"

manifest_version="$(scripts/manifest-version.sh "bundles/${bundle}.yml")"
if [ "$version" != "$manifest_version" ]; then
	echo "ERROR: tag version ${version} does not match bundles/${bundle}.yml version ${manifest_version}" >&2
	exit 1
fi
