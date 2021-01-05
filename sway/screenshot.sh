#!/usr/bin/env bash

# Safe bash settings
# -e            Exit on command fail
# -u            Exit on unset variable
# -o pipefail   Set error if piped command has error code
set -eu -o pipefail

FILE="$(xdg-user-dir PICTURES)/$(date +'Screenshot %Y-%m-%d-%H%M%S.png')"
SELECTION="$(slurp)"
grim -g "${SELECTION}" "${FILE}"
wl-copy < "${FILE}"
swappy -f "${FILE}" -o "${FILE}"
wl-copy < "${FILE}"
