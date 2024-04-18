#!/usr/bin/env bash
REPO_DIR=$(mktemp -d -t mac-dotfiles-XXXXXXXXXX)
git clone --depth=1 git@github.com:joe-dipilato/mac-dotfiles.git "${REPO_DIR}/mac-dotfiles"
source "${REPO_DIR}"/install.sh
# rm -rf "${REPO_DIR}"
