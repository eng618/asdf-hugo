#!/usr/bin/env bash

set -euo pipefail

# Source utils for fail function
source "$(dirname "$0")/../lib/utils.bash"

# Default to check mode
FIX_MODE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
  --fix)
    FIX_MODE=true
    shift
    ;;
  *)
    fail "Unknown option: $1"
    ;;
  esac
done

# Find all shell files
mapfile -t SHELL_FILES < <(find . -type f \( -name "*.sh" -o -name "*.bash" \) -not -path "./.git/*" | sort)

# Linting with shellcheck
echo "Running shellcheck..."
if [[ $FIX_MODE == true ]]; then
  # Shellcheck has limited --fix support, so run normally and warn
  if ! shellcheck -s bash -x bin/* -P lib/; then
    echo "Warning: shellcheck found issues. Manual fixes may be needed."
  fi
else
  shellcheck -s bash -x bin/* -P lib/
fi

# Formatting with shfmt
echo "Running shfmt..."
if [[ $FIX_MODE == true ]]; then
  shfmt -w "${SHELL_FILES[@]}"
  echo "Formatting applied."
else
  shfmt -d "${SHELL_FILES[@]}"
fi

echo "Linting complete."
