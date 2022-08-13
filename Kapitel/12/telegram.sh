#!/bin/bash

# Zugriff zur Telegram-API
API_KEY="5124884970:AEAUDx-EwskpnYh-eHie8d4zZa-ffN4kwi8"
CHAT_ID=123456789

while read LINE; do
  # Nachricht an Telegram senden
  /usr/bin/curl --silent --data "chat_id=$CHAT_ID&text=$LINE" \
    https://api.telegram.org/bot$API_KEY/sendMessage >/dev/null
done

exit 0
