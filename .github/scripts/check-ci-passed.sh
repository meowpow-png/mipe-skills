#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: check-ci-passed.sh <sha>" >&2
	echo "  requires GH_TOKEN and GITHUB_REPOSITORY in the environment" >&2
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

sha="$1"

conclusion="$(gh api "repos/${GITHUB_REPOSITORY}/actions/runs?head_sha=${sha}" \
	--jq '[.workflow_runs[] | select(.name == "CI")][0].conclusion // empty')"

if [ "$conclusion" != "success" ]; then
	echo "ERROR: no successful CI run found for commit ${sha}" >&2
	exit 1
fi
