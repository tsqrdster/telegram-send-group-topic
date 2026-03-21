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
    . "$CONFIG_FILE"
else
    echo "ERROR: Configuration file $CONFIG_FILE not found!"
    exit 1
fi

MESSAGE=$1
TOPIC_ID=$2

# Check if a message was provided
if [ -z "$MESSAGE" ]; then
    echo "Usage: $0 \"Your message here\" \"The Topic ID here (optional)\""
    exit 1
fi

# Send to Telegram
# Check if a topic was NOT provided
if [ -z "TOPIC_ID" ]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
       -d chat_id="$CHAT_ID" \
       --data-urlencode text="$MESSAGE" > /dev/null
else
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
       -d chat_id="$CHAT_ID" \
       -d message_thread_id="$TOPIC_ID" \
       --data-urlencode text="$MESSAGE" > /dev/null
fi
echo "${SEND_CONFIRMATION_MESSAGE}"
