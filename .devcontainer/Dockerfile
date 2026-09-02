# Mirrors QECLean's devcontainer image (which mirrors mathlib4's): a plain
# Ubuntu devcontainer base with elan installed but no toolchain baked in. The
# toolchain is resolved from the repo's `lean-toolchain` in setup.sh, so this
# image does not go stale when the project bumps Lean.
FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER vscode
WORKDIR /home/vscode

RUN curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y --default-toolchain none

ENV PATH="/home/vscode/.elan/bin:${PATH}"
