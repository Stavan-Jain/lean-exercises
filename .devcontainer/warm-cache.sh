#!/usr/bin/env bash
# Pull Lean's compiled artifacts into the kernel page cache, in the background,
# every time the container starts.
#
# Why: a prebuilt codespace already has every .olean on disk, so nothing needs
# building — but the language server's first `import Mathlib.Tactic` still has
# to read them cold off the codespace's network-backed disk. That read is
# ~1.2 GB (measured: ~0.8 GB across mathlib and its deps, ~0.36 GB of core
# Init/Lean/Std oleans) and it is the bulk of the wait before the first goal
# state appears; locally the same imports take ~21 s cold and ~2.4 s warm.
# Reading the files here overlaps that I/O with VS Code and Lean-extension
# startup instead of serialising it after them.
#
# Page cache is reclaimable, so this cannot starve the Lean server of memory;
# worst case the pages are evicted and we are no worse off than before.
set -uo pipefail
cd "$(dirname "$0")/.."

# I/O-bound, so oversubscribe the 4 cores: concurrent reads keep the
# network-backed disk busy in a way a single sequential `cat` does not.
warm() { xargs -0 -P 8 -n 32 cat >/dev/null 2>&1 || true; }

toolchain_lib=""
if prefix=$(lake env lean --print-prefix 2>/dev/null); then
  toolchain_lib="$prefix/lib/lean"
fi

# Pass 1: what the server reads to answer the first goal — module interfaces
# (.olean) and the hover/go-to-definition data (.olean.server).
for root in .lake $toolchain_lib; do
  [ -d "$root" ] || continue
  find "$root" \( -name '*.olean' -o -name '*.olean.server' \) -print0 2>/dev/null | warm
done

# Pass 2: proof bodies, read lazily and only for the declarations someone
# actually unfolds. Bigger than pass 1 (~4 GB), so it must not delay it.
for root in .lake $toolchain_lib; do
  [ -d "$root" ] || continue
  find "$root" -name '*.olean.private' -print0 2>/dev/null | warm
done
