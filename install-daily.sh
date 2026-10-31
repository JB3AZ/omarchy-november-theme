#!/usr/bin/env bash
# Install November daily wallpaper timer for the current user.
set -euo pipefail

THEME_DIR="$(cd "$(dirname "$0")" && pwd)"
UNIT_DIR="$HOME/.config/systemd/user"
mkdir -p "$UNIT_DIR"

# Ensure theme lives where the units expect it
TARGET="$HOME/.config/omarchy/themes/november"
if [[ "$THEME_DIR" != "$TARGET" ]]; then
  mkdir -p "$(dirname "$TARGET")"
  if [[ -e "$TARGET" && "$TARGET" -ef "$THEME_DIR" ]]; then
    :
  elif [[ -e "$TARGET" ]]; then
    echo "Note: $TARGET already exists; units will use that copy."
    echo "If you meant this folder, replace it first:"
    echo "  rm -rf \"$TARGET\" && cp -r \"$THEME_DIR\" \"$TARGET\""
  else
    cp -a "$THEME_DIR" "$TARGET"
    echo "Copied theme to $TARGET"
  fi
fi

install -m 644 "$THEME_DIR/november-wallpaper.service" "$UNIT_DIR/november-wallpaper.service"
install -m 644 "$THEME_DIR/november-wallpaper.timer" "$UNIT_DIR/november-wallpaper.timer"
chmod +x "$TARGET/bin/november-daily-wallpaper"

systemctl --user daemon-reload
systemctl --user enable --now november-wallpaper.timer
# Apply today's wallpaper immediately
systemctl --user start november-wallpaper.service || "$TARGET/bin/november-daily-wallpaper"

echo "November daily wallpaper timer enabled."
echo "  systemctl --user status november-wallpaper.timer"
