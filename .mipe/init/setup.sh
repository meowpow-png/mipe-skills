#!/usr/bin/env bash
set -euo pipefail

setup_project() {
	for agent in .codex .claude; do
		echo "• Preparing $agent"

		rm -rf "$agent/skills"
		mkdir -p "$agent"

		echo "• Copying skills -> $agent/"
		cp -a skills "$agent/"
	done
}
