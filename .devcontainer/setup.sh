#!/usr/bin/env bash
# Devcontainer / Codespace provisioning for the tutorial exercises.
# Mirrors QECLean/.devcontainer/setup.sh.
#
#   1. install the toolchain pinned in `lean-toolchain`
#   2. pull mathlib's prebuilt oleans from the cache (never build mathlib)
#   3. build the tutorial files (small; the exercise files warn about their
#      `sorry`s by design)
#
# Stage 2 (QCE26): when the QECLean dependency lands for the session-2
# exercises, add `lake build QECLight` after step 2 — see QECLean's setup.sh
# for the memory rationale.
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> Installing Lean toolchain ($(cat lean-toolchain))"
elan toolchain install "$(cat lean-toolchain)"
elan override set "$(cat lean-toolchain)"

echo "==> Fetching mathlib cache"
lake exe cache get

echo "==> Building the tutorial files"
lake build

echo "==> Ready. Open Tutorial/Session1/E1_Logic.lean to begin."
