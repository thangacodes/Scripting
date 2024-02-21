#!/bin/bash

## Defining variables
BACKUP_SRC="/tmp/"
BACKUP_DEST="/root"
BACKUP_DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="backup_$BACKUP_DATE.tar.gz"

mkdir -p "$BACKUP_DEST/$BACKUP_DATE"

# Archive the source directory

tar -czf "$BACKUP_DEST/$BACKUP_DATE/$BACKUP_FILE" "$BACKUP_SRC"

# Verify the backup was created success

if [ $? -eq 0 ]; then
        echo "Backup successfull: $BACKUP_FILE"
else
        echo "Backup failed"
fi

