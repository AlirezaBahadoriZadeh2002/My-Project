#!/bin/bash


conf="nginx.conf"





if [ -f "$conf" ]; then
	conf_backup="conf-backup/$(date +'%Y-%m-%d_%H-%M-%S').conf"
   	mv "$conf" "$conf_backup"
fi




query=$(curl -s http://127.0.0.1:8500/v1/kv/"$conf")





file=$(echo "$query" | jq -r '.[0].Value' | base64 -d)



echo "$file" > "$conf"



curl -X DELETE http://127.0.0.1:8500/v1/kv/"$conf"

curl main-app:5000/restart
