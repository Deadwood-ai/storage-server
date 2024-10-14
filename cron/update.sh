#!/bin/bash
# run this script as the appropriate user's cron job
# can be activated (once only) as:
# crontab -e
# and then add the following line to run the script every hour:
# 0 * * * * /path/to/update.sh
# or to run the script every night at 1:30 am:
# 30 1 * * * /path/to/update.sh


# get the location of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# move one level up
cd $SCRIPT_DIR/..

# pull the latest changes to the repository
git pull

# update the docker compose file
docker compose -f docker-compose.api.yml pull
docker compose -f docker-compose.api.yml build
docker compose -f docker-compose.api.yml up -d --remove-orphans

# update nginx config
#cp ./nginx/storage-api.conf /etc/nginx/sites-available/storage-api.conf
#service nginx reload

# restart background process
# docker compose run --rm migrate python run.py start-queue