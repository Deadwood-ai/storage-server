#!/bin/bash
# run this script as the appropriate user's cron job
# can be activated (once only) as:
# crontab -e
# and then add the following line to run the script every hour:
# 0 * * * * /path/to/queue.sh
# or to run the script every night at 1:30 am:
# 30 1 * * * /path/to/queue.sh


# get the location of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# move one level up
cd $SCRIPT_DIR/..

# run a queue worker
# this will check if there are tasks, but no active queue worker
# that can happen when a task throws an exception that stops the Python process
# if there are tasks, it will start a queue worker
docker compose run --rm migrate python run.py start-queue