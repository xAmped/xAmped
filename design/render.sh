#!/usr/bin/env bash
# Renders design/assets.html into assets/*.png at 2x, transparent outside the rounded corners.
# Usage: design/render.sh [path-to-chromium]   (defaults to Playwright's Chromium)
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="${1:-$(ls -d ~/.cache/ms-playwright/chromium-*/chrome-linux64/chrome | tail -1)}"
mkdir -p assets

render() { # name width height
  "$CHROME" --headless=new --no-sandbox --hide-scrollbars --force-device-scale-factor=2 \
    --default-background-color=00000000 --virtual-time-budget=6000 --window-size="$2,$3" \
    --screenshot="assets/$1.png" "file://$PWD/design/assets.html#$1" 2>/dev/null
}

render banner 880 230
render propflow 880 170
render vest-copier 280 150
render stratuh 280 150
render insiders-coffee 280 150
