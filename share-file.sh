#!/bin/bash

SHARE_ARG_FULL_PATH=$(realpath $1)
SHARE_ARG_NAME=${SHARE_ARG_FULL_PATH##*/}
SERVER_EXTERNAL_IP=$(curl -s ipinfo.io/ip)
KILL_COUNT_DOWN=$((150))
DOCKER_ID=$(docker run -dP -v $SHARE_ARG_FULL_PATH:/usr/local/apache2/htdocs/$SHARE_ARG_NAME httpd)

SHARE_PORT=$(docker port $DOCKER_ID|sed -e 's#.*.0\(\)#\1#')
echo -e "Share URL is : \033[0;31mhttp://$SERVER_EXTERNAL_IP$SHARE_PORT/$SHARE_ARG_NAME \033[0m"


secs=$KILL_COUNT_DOWN
while [ $secs -gt 0 ]; do
   echo -ne "Container will be killed in $secs\033[0K\r"
   sleep 1
   : $((secs--))
done


docker kill $DOCKER_ID
