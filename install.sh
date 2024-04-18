#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
"${SCRIPT_DIR}"/packages/brew_install.sh
"${SCRIPT_DIR}"/packages/custom_install.sh
