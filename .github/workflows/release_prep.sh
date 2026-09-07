#!/usr/bin/env bash
# Builds the release archive and prints release notes to stdout.
set -o errexit -o nounset -o pipefail

TAG="$1"
VERSION="${TAG#v}"
ARCHIVE="bazel-attest-probe-${TAG}.zip"

# `zip` follows symlinks and stores the target contents, so `bazel-*` must be
# excluded or the whole bazel output tree lands in the archive.
zip --quiet --recurse-paths "${ARCHIVE}" . \
  -x '*.git*' '.editorconfig' 'bazel-*' "${ARCHIVE}"

cat <<NOTES
## Using Bzlmod

\`\`\`starlark
bazel_dep(name = "bazel_attest_probe", version = "${VERSION}")
\`\`\`
NOTES
