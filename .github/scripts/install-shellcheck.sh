#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
	echo "usage: install-shellcheck.sh <version>" >&2
	exit 1
fi

version="$1"

wget "https://github.com/koalaman/shellcheck/releases/download/${version}/shellcheck-${version}.linux.x86_64.tar.xz"
tar -xf "shellcheck-${version}.linux.x86_64.tar.xz"
sudo cp "shellcheck-${version}/shellcheck" /usr/bin/
