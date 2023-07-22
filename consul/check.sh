#!/bin/bash



html="index.html"
conf="nginx.conf"





function check {

	html_file=$(curl -s "http://127.0.0.1:8500/v1/kv/$html" | jq -r '.[0].Value')
	conf_file=$(curl -s "http://127.0.0.1:8500/v1/kv/$conf" | jq -r '.[0].Value')


	if [[ -n "$html_file" ]]; then
		bash "/project/html-replace.sh"
	elif [[ -n "$conf_file" ]]; then
		bash "/project/conf-replace.sh"
	fi

}




trap 'exit 0' INT

while true; do
	check
	sleep 2
done











