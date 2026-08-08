#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
	echo "usage: install-dprint.sh <version>" >&2
	exit 1
fi

version="$1"

curl -fsSL -o dprint.zip "https://github.com/dprint/dprint/releases/download/${version}/dprint-x86_64-unknown-linux-gnu.zip"
unzip dprint.zip -d /tmp/dprint
sudo cp /tmp/dprint/dprint /usr/bin/
