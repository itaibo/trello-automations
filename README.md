# Trello automations

## Requirements
Add these environment variables from [Developer API Keys](https://trello.com/app-key):
- `TRELLO_API_KEY`
- `TRELLO_API_TOKEN`

## Available scripts
```sh
# Marks as complete all cards in list(s)
./complete.sh <list_id>[,<list_id>...]

# Archives all cards in list(s)
./archive.sh <list_id>[,<list_id>...]
```

## Docker
```sh
docker build -t trello-automations .

docker run -it \
  --env TRELLO_API_KEY=your_key \
  --env TRELLO_API_TOKEN=your_token \
  trello-automations sh
```

## Schedule with cron
```sh
# Mark all cards in a list as complete every 6 hours
0 */6 * * * complete.sh <list_id>

# Archive all cards in two lists every Monday at 1 AM
0 1 * * 1 archive.sh <list_id>,<list_id_2>
```
