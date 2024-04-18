#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
IFS=$'\n' read -d '' -r -a PACKAGES < "${SCRIPT_DIR}/brew.txt"
echo "================================================================================"
echo "${PACKAGES[@]}"
echo "================================================================================"
brew install --dry-run "${PACKAGES[@]}"
brew install "${PACKAGES[@]}"
