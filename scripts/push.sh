#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: push.sh <bundle> [extra-tag ...]" >&2
}

if [ "$#" -lt 1 ]; then
	usage
	exit 1
fi

bundle="$1"
shift
extra_tags=("$@")

registry="${REGISTRY:-ghcr.io/meowpow-png/mipe-skills}"
layer_media_type="application/vnd.mipe.skill.layer.v1.tar+gzip"
artifact_type="application/vnd.mipe.skill.package.v1+json"

layer_path="build/bundles/${bundle}.tar.gz"
if [ ! -f "$layer_path" ]; then
	echo "ERROR: built artifact not found: $layer_path (run 'package.sh ${bundle}' first)" >&2
	exit 1
fi

if ! version="$(tar xzOf "$layer_path" manifest.yml | scripts/manifest-version.sh)"; then
	echo "ERROR: no version declared in ${layer_path}'s manifest.yml" >&2
	exit 1
fi

tags=("$version" "latest" "${extra_tags[@]}")

ref="${registry}/${bundle}:$(
	IFS=,
	echo "${tags[*]}"
)"
echo "Pushing ${ref}"
oras push \
	--artifact-type "$artifact_type" \
	"$ref" \
	"${layer_path}:${layer_media_type}"

echo "Published bundle '${bundle}' as ${#tags[@]} tag(s): ${tags[*]}"
