#!/bin/bash

if [ -z "$TRELLO_API_KEY" ] || [ -z "$TRELLO_API_TOKEN" ]; then
  echo "Missing TRELLO_API_KEY or TRELLO_API_TOKEN env vars"
  exit 1
fi

LIST_IDS=${1//,/ }

if [ -z "$LIST_IDS" ]; then
  echo "Usage: ./complete_done.sh <list_id>[,<list_id>...]"
  exit 1
fi

for LIST_ID in $LIST_IDS; do
  cards=$(curl -s "https://api.trello.com/1/lists/$LIST_ID/cards?key=$TRELLO_API_KEY&token=$TRELLO_API_TOKEN")
  echo "$cards" | jq -e -r '.[].id' 2>/dev/null | while read -r card_id; do
    curl -s -X PUT "https://api.trello.com/1/cards/$card_id?dueComplete=true&key=$TRELLO_API_KEY&token=$TRELLO_API_TOKEN" > /dev/null
  done
  echo "Marked all cards in list $LIST_ID as complete."
done
