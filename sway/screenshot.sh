#!/usr/bin/env bash

# Safe bash settings
# -e            Exit on command fail
# -u            Exit on unset variable
# -o pipefail   Set error if piped command has error code
set -eu -o pipefail

FILE="$(xdg-user-dir PICTURES)/$(date +'Screenshot %Y-%m-%d-%H%M%S.png')"
grim -g "$(slurp)" "${FILE}"
echo "${FILE}"
wl-copy < "${FILE}"
