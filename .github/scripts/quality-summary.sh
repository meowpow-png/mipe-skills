#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"
TEMPLATE="${ROOT_DIR}/.github/templates/quality-summary.md"

required=(
	LINT_STATUS
	FORMAT_STATUS
	MARKDOWN_STATUS
)

missing=()

for var in "${required[@]}"; do
	if [[ -z "${!var:-}" ]]; then
		missing+=("$var")
	fi
done

if ((${#missing[@]})); then
	printf 'Missing required quality-summary environment variables:\n' >&2
	printf '  %s\n' "${missing[@]}" >&2
	exit 1
fi

envsubst <"${TEMPLATE}"
