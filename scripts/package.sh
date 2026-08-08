#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: package.sh <bundle>" >&2
}

if [ "$#" -ne 1 ]; then
	usage
	exit 1
fi

bundle="$1"

bundle_file="bundles/${bundle}.yml"
if [ ! -f "$bundle_file" ]; then
	echo "ERROR: bundle manifest not found: $bundle_file" >&2
	exit 1
fi

mapfile -t skill_names < <(grep -E '^[[:space:]]*-[[:space:]]*' "$bundle_file" | sed -E 's/^[[:space:]]*-[[:space:]]*//; s/[[:space:]]+$//')
if [ "${#skill_names[@]}" -eq 0 ]; then
	echo "ERROR: no skills declared in $bundle_file" >&2
	exit 1
fi

staging_dir="$(mktemp -d)"
trap 'rm -rf "$staging_dir"' EXIT

for name in "${skill_names[@]}"; do
	source_dir="skills/${name}"
	if [ ! -f "${source_dir}/SKILL.md" ]; then
		echo "ERROR: skill '${name}' is missing ${source_dir}/SKILL.md" >&2
		exit 1
	fi
	mkdir -p "${staging_dir}/skills"
	cp -r "$source_dir" "${staging_dir}/skills/${name}"
	echo "Staged skill '${name}'"
done

output_dir="build/bundles"
output_path="${output_dir}/${bundle}.tar.gz"
mkdir -p "$output_dir"

tar --numeric-owner --owner=0 --group=0 -czf "$output_path" -C "$staging_dir" skills

echo "Wrote ${output_path}"
