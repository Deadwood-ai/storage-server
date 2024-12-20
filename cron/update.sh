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
git pull --recurse-submodules

# for easier handling the PRODUCTION docker compose file, we copy the api file to the local-only default file
cp docker-compose.legacy.yml docker-compose.yml

# update the docker compose file
docker compose pull
docker compose build
docker compose up -d --remove-orphans

# update nginx config
#cp ./nginx/storage-api.conf /etc/nginx/sites-available/storage-api.conf
#service nginx reload

# restart background process
# docker compose run --rm migrate python run.py start-queue