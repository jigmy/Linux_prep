#!/bin/bash
# simple_restore.sh

# Configure restore locations
BACKUP_DIR="/path/to/backups"
RESTORE_DIR="/path/to/restore"

# List available backups
echo "Available backups:"
ls -1 "$BACKUP_DIR"

# Ask which backup to restore
read -p "Enter backup name to restore: " BACKUP_NAME

# Create restore directory
mkdir -p "$RESTORE_DIR"

# Restore the backup
echo "Restoring $BACKUP_NAME..."
tar -xzf "$BACKUP_DIR/$BACKUP_NAME" -C "$RESTORE_DIR"

echo "Restore completed to: $RESTORE_DIR"
