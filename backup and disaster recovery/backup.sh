#!/bin/bash
# simple_backup.sh

# Configure backup locations
SOURCE_DIR="/path/to/your/data"  # Directory to backup
BACKUP_DIR="/path/to/backups"    # Where to store backups

# Create backup name with date
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the backup
echo "Creating backup: $BACKUP_NAME"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# Keep only last 5 backups (optional)
cd "$BACKUP_DIR"
ls -t | tail -n +6 | xargs -r rm

# Copy to remote server (optional)
# rsync -av "$BACKUP_DIR/$BACKUP_NAME" "$REMOTE_DIR"

echo "Backup completed!"
