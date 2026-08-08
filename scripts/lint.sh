#!/usr/bin/env bash
set -euo pipefail

# Lints shell scripts with shellcheck via docker compose.
# Defaults to every tracked .sh file when none are given.

files=("$@")
if [ "${#files[@]}" -eq 0 ]; then
	mapfile -t files < <(find . -name '*.sh' -not -path './.git/*' -not -path './build/*')
fi

if [ "${#files[@]}" -eq 0 ]; then
	echo "ERROR: no shell scripts found" >&2
	exit 1
fi

echo "Discovered ${#files[@]} file(s):"
printf '  %s\n' "${files[@]}"

echo "Running: docker compose run --rm shellcheck"
docker compose run --rm shellcheck "${files[@]}"
