#!/bin/bash

# Directory.
cd /home/centos/scripts/backup/core

# Backup Redis.
python cli-backup.py redis-backup

# Backup MySQL.
python cli-backup.py mysql-backup