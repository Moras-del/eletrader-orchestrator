#!/bin/bash
curr_files_count=$(ls /backups/ | wc -l)

if (($curr_files_count >= ${BACKUP_LIVING_MONTHS}))
then
	oldest_file=$(ls -t /backups/ | tail -1)
        rm /backups/$oldest_file
fi

pg_dump -U $POSTGRES_USER -c $POSTGRES_DB > /backups/${POSTGRES_DB}_backup_$(date +"%d-%m-%y")
echo "Backup process finished with exit code $?"
