#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
grep -q 'name = "bazel_attest_probe"' MODULE.bazel
echo "ok"
