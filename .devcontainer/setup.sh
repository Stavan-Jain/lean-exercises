#!/usr/bin/env bash
# Devcontainer / Codespace provisioning for the tutorial exercises.
# Mirrors QECLean/.devcontainer/setup.sh.
#
#   1. install the toolchain pinned in `lean-toolchain`
#   2. pull mathlib's prebuilt oleans from the cache (never build mathlib)
#   3. build QECLight — QECLean minus its bivariate-bicycle leaves, which need
#      more memory than this container has (see QECLean's setup.sh)
#   4. build the tutorial files (small; the exercise files warn about their
#      `sorry`s by design)
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> Installing Lean toolchain ($(cat lean-toolchain))"
elan toolchain install "$(cat lean-toolchain)"
elan override set "$(cat lean-toolchain)"

echo "==> Fetching mathlib cache"
lake exe cache get

echo "==> Building QECLight"
lake build QEC/QECLight

echo "==> Building the tutorial files"
lake build

echo "==> Ready. Open Tutorial/Session1/E1_Logic.lean to begin."
