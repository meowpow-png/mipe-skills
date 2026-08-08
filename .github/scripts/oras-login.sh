#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: oras-login.sh <username>" >&2
	echo "  reads the password from stdin" >&2
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

oras login ghcr.io -u "$1" --password-stdin
