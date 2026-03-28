#!/usr/bin/env bash
# Red Team Session Logger (bash)
set -euo pipefail

# client from argv[1] or prompt
if [ $# -eq 0 ]; then
  printf "Enter client/engagement name: "
  read -r client
else
  client="$1"
fi

# sanitize folder name (spaces -> _)
client="${client// /_}"

# ensure not empty
if [ -z "$client" ]; then
  echo "client name is empty. aborting."
  exit 1
fi

logdir="$HOME/.redlogs/$client"
mkdir -p -- "$logdir"

# safer timestamp for filenames (no colons)
ts="$(date +'%Y-%m-%d_%H-%M-%S')"
logfile="$logdir/session_$ts.log"

echo "---------------------------------------------"
echo "Starting Red Team logging session"
echo "Client/Engagement : $client"
echo "Log File          : $logfile"
echo "---------------------------------------------"

# choose shell to record: prefer current shell if available, fall back to bash
record_shell="${RECORD_SHELL:-${SHELL:-/bin/bash}}"

# Use `script` to capture the session. -q quiet, -f flush after each write, -c to run a command
script -q -f -c "$record_shell" "$logfile"

echo "---------------------------------------------"
echo "Session ended. Log saved to $logfile"
echo "---------------------------------------------"
