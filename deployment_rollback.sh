#!/bin/bash

previous_version="v1"
kubectl set image deployment/nginx-deployment nginx=nginx:"$previous_version" --record