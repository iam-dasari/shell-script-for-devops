#!/bin/bash

source_file="/tmp/app.py"
destination_server="user@hostname:/tmp/"
scp "$source_file" "$destination_server"