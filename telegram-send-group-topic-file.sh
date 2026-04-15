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
TOPIC_ID=$2
FILE_PATH=$3

# Check if a message was provided
if [[ -z "$MESSAGE" || -z "$TOPIC_ID" || -z "$FILE_PATH" ]]; then
    echo "Usage: $0 \"Your message here\" \"The Topic ID here\" \"The File and path here\""
    exit 1
fi

# Build the exact URL
URL="https://api.telegram.org/bot${TOKEN}/sendDocument"

RESPONSE=$(curl --max-time 20 --connect-timeout 10 -s -L \
     -F "chat_id=${CHAT_ID}" \
     -F "message_thread_id=${TOPIC_ID}" \
     -F "document=@${FILE_PATH}" \
     -F "caption=${MESSAGE}" \
     -F "parse_mode=HTML" \
     "${URL}")

if [[ $RESPONSE == *"\"ok\":true"* ]]; then
    echo "${SEND_CONFIRMATION_MESSAGE}"
else
    echo "Error sending Telegram file: $RESPONSE"
fi