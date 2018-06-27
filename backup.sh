#!/bin/sh

DB_NAME=replace_to_db_name
BACKUP_DIR=/path/to/backup_dir
DELETE_OLD_DAYS=5

mysqldump --defaults-extra-file=./my.conf $DB_NAME > "${BACKUP_DIR}/${DB_NAME}_backup_`date '+%Y%m%%d%H%M%S'`.sql"

find ${BACKUP_DIR} -mtime +${DELETE_OLD_DAYS} -exec rm -f {} \;
