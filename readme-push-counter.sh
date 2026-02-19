#!/bin/bash
# readme-push-counter.sh
# Tracks git push frequency and nudges the user to update their README.
# Called by PostToolUse hook on Bash tool events.
#
# Environment:
#   CRAFT_EVENT_DATA - JSON with tool input/output
#   CRAFT_WORKING_DIR - Current working directory (repo path)
#
# Config:
PUSH_THRESHOLD=${README_PUSH_THRESHOLD:-5}
COUNTER_DIR="/tmp/craft-readme-counters"

# Parse the Bash command from event data
COMMAND=$(echo "$CRAFT_EVENT_DATA" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    # Navigate the event data to find the bash command
    inp = data.get('input', data)
    cmd = inp.get('command', '')
    print(cmd)
except:
    print('')
" 2>/dev/null)

# Only care about git push commands
case "$COMMAND" in
  *"git push"*|*"git push "*)
    ;;
  *)
    exit 0
    ;;
esac

# Determine repo identity from working directory
REPO_DIR="${CRAFT_WORKING_DIR:-$(pwd)}"
REPO_HASH=$(echo "$REPO_DIR" | md5 2>/dev/null || echo "$REPO_DIR" | md5sum 2>/dev/null | cut -d' ' -f1)
COUNTER_FILE="$COUNTER_DIR/$REPO_HASH"

mkdir -p "$COUNTER_DIR"

# Read current count
if [ -f "$COUNTER_FILE" ]; then
  COUNT=$(cat "$COUNTER_FILE")
else
  COUNT=0
fi

# Increment
COUNT=$((COUNT + 1))
echo "$COUNT" > "$COUNTER_FILE"

# Check threshold
if [ "$COUNT" -ge "$PUSH_THRESHOLD" ]; then
  # Reset counter
  echo "0" > "$COUNTER_FILE"

  # Output nudge — this stdout gets fed back to the agent
  REPO_NAME=$(basename "$REPO_DIR")
  cat <<MSG
---
README Update Reminder: You've pushed ${COUNT} times to "${REPO_NAME}" since the last README check. Consider running /readme --update to keep it fresh.
---
MSG
fi
