#!/bin/bash

service_name=$1

if systemctl is-active --quiet "$service_name"; then
    systemctl restart "$service_name"
    echo "Service $service_name restarted"
else
    echo "Service $service_name is not running"
fi