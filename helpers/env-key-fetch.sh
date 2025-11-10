#!/usr/bin/env bash

fetch_keys (){
	local regex="(key.*):(.*)"
	if [[ $1 =~ $regex ]]; then
		key_name="${BASH_REMATCH[1]}"
		key_value="${BASH_REMATCH[2]}"
		echo "$key_value"
		return 0
	fi
	echo "No matches found"
	return 1
}
mapfile keys < $1
for key in "$keys[@]";do
	fetch_keys $key
done
