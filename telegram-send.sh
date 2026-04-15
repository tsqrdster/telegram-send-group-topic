#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
CONFIG_FILE="$SCRIPT_DIR/telegram-send.conf"

# Configuration - IN .conf FILE
# TOKEN="<Telegram BOT token here>"
# CHAT_ID="<Telegram chat ID here>"
# SEND_CONFIRMATION_MESSAGE="Telegram message sent!"

# Check if the config file exists before trying to load it
if [[ -f "$CONFIG_FILE" ]]; then
    # The dot (.) is the command for 'source'
    # shellcheck disable=SC1090
    . "$CONFIG_FILE"
else
    echo "ERROR: Configuration file $CONFIG_FILE not found!"
    exit 1
fi

MESSAGE=$1

# Check if a message was provided
if [ -z "$MESSAGE" ]; then
    echo "Usage: $0 \"Your message here\""
    exit 1
fi

# Send to Telegram
RESPONSE=$(curl --max-time 10 --connect-timeout 5 -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     --data-urlencode text="$MESSAGE")

if [[ $RESPONSE == *"\"ok\":true"* ]]; then
    echo "${SEND_CONFIRMATION_MESSAGE}"
else
    echo "Error sending Telegram message."
fi
