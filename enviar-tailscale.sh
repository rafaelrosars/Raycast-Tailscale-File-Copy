#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Enviar Tailscale
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📡

# Documentation:
# @raycast.author rafaelrosars
# @raycast.authorURL https://raycast.com/rafaelrosars

# Capture ALL selected paths in Finder
FILES=$(osascript <<EOD
tell application "Finder"
  set sel to selection
  if sel is {} then
    return ""
  else
    set output to ""
    repeat with i in sel
      set output to output & POSIX path of (i as alias) & linefeed
    end repeat
    return output
  end if
end tell
EOD
)

# Remove blank lines and convert to array
IFS=$'\n' read -rd '' -a FILE_ARRAY <<<"$FILES"

DEVICE="xxx" # Tailscale device destination name

# Check if there are any files
if [ ${#FILE_ARRAY[@]} -eq 0 ]; then
  echo "❌ No files selected in Finder."
  exit 1
fi

# Send all files via Tailscale
tailscale file cp "${FILE_ARRAY[@]}" "$DEVICE:"
echo "📡 ${#FILE_ARRAY[@]} file(s) sent to '$DEVICE'"