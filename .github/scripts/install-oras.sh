#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
	echo "usage: install-oras.sh <version>" >&2
	exit 1
fi

version="$1"

wget "https://github.com/oras-project/oras/releases/download/v${version}/oras_${version}_linux_amd64.tar.gz"
tar -xf "oras_${version}_linux_amd64.tar.gz" oras
sudo cp oras /usr/bin/
