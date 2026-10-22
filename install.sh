#!/usr/bin/env bash
# Menu 11 Next — Win11 fork installer
# Installs (or upgrades) the widget package into your local Plasma 6 widgets,
# keeping your existing widget instance and configuration intact.
set -euo pipefail

THIS_DIR=$(cd "$(dirname "$0")" && pwd)

if ! command -v kpackagetool6 >/dev/null 2>&1; then
    echo "Error: kpackagetool6 not found — is KDE Plasma 6 installed?" >&2
    exit 1
fi

# Try upgrade first (keeps config), fall back to fresh install
if kpackagetool6 --type Plasma/Applet --upgrade "$THIS_DIR" 2>/dev/null; then
    echo "✔ Upgraded widget package (existing instance keeps its settings)."
else
    kpackagetool6 --type Plasma/Applet --install "$THIS_DIR"
    echo "✔ Installed widget package."
fi

kbuildsycoca6 --noincremental >/dev/null 2>&1 || true

cat <<'EOF'

Done. Notes:
  • If a Menu 11 Next widget is already on your panel it now runs this version —
    restart plasmashell to be safe:  systemctl --user restart plasma-plasmashell
  • For the full Win11 floating look (rounded corners on all sides):
    right-click the start button → Configure Menu 11 Next →
    Menu position → "Center", and use a rounded Plasma style
    (e.g. win11os rooms theme: https://github.com/yeyushengfan258/Win11OS-kde)
EOF
