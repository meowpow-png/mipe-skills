#!/usr/bin/env bash
set -euo pipefail

# Checks shell script formatting with shfmt via docker compose.
# Defaults to every tracked .sh file when none are given.

flags=()
files=()
for arg in "$@"; do
	case "$arg" in
	-*) flags+=("$arg") ;;
	*) files+=("$arg") ;;
	esac
done

if [ "${#flags[@]}" -eq 0 ]; then
	flags=("-d")
fi

if [ "${#files[@]}" -eq 0 ]; then
	mapfile -t files < <(find . -name '*.sh' -not -path './.git/*' -not -path './build/*')
fi

if [ "${#files[@]}" -eq 0 ]; then
	echo "ERROR: no shell scripts found" >&2
	exit 1
fi

echo "Discovered ${#files[@]} file(s):"
printf '  %s\n' "${files[@]}"

user="$(id -u):$(id -g)"
echo "Running: docker compose run --rm --user ${user} shfmt ${flags[*]} ${files[*]}"
docker compose run --rm --user "$user" shfmt "${flags[@]}" "${files[@]}"
