#!/bin/bash

backup_dir="/tmp/backup"
source_dir="/logfiles"
DATE=$(date +%F)
tar -czf "$backup_dir/backup_$timestamp.tar.gz" "$source_dir"