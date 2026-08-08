#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "usage: push.sh <bundle> <tag> [<tag> ...]" >&2
}

if [ "$#" -lt 2 ]; then
	usage
	exit 1
fi

bundle="$1"
shift
tags=("$@")

registry="${REGISTRY:-ghcr.io/meowpow-png/mipe-skills}"
layer_media_type="application/vnd.mipe.skill.layer.v1.tar+gzip"
artifact_type="application/vnd.mipe.skill.package.v1+json"

layer_path="build/bundles/${bundle}.tar.gz"
if [ ! -f "$layer_path" ]; then
	echo "ERROR: built artifact not found: $layer_path (run 'package.sh ${bundle}' first)" >&2
	exit 1
fi

ref="${registry}/${bundle}:$(IFS=,; echo "${tags[*]}")"
echo "Pushing ${ref}"
oras push \
	--artifact-type "$artifact_type" \
	"$ref" \
	"${layer_path}:${layer_media_type}"

echo "Published bundle '${bundle}' as ${#tags[@]} tag(s): ${tags[*]}"
