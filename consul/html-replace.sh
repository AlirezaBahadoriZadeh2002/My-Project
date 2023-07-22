#!/bin/bash


html="index.html"





if [ -f "$html" ]; then
	html_backup="html-backup/$(date +'%Y-%m-%d_%H-%M-%S').html"
   	mv "$html" "$html_backup"
fi




query=$(curl -s http://127.0.0.1:8500/v1/kv/"$html")





file=$(echo "$query" | jq -r '.[0].Value' | base64 -d)



echo "$file" > "$html"




curl -X DELETE http://127.0.0.1:8500/v1/kv/"$html"
