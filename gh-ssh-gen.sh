#!/bin/bash

# Key is generated from your personal access tokens
# Classical token
# GIT_KEY="<YourClassicalToken>"

# Fine-grained token
GIT_FG_TOKEN="<YourFineGrainedAccessToken>"

# URL of the request
URL="https://api.github.com/user/keys"

# echo "HOST: $HOST
#       KEY_ID: $KEY_ID
#       URL: $HOST/$user_keys
#       -H "Authorization: Bearer $GIT_FG_TOKEN" \
# "



public_key="$1.pub"
private_key="$1"

# generating the SSH key, 
# -t is the type flag, rsa, dsa, rsa1 ...
# github docs suggestes to set the type as ed25519
# -N to set a passpharse
# -C a comment (set your email here)
# -f is the output file where it will be saved
ssh-keygen -t ed25519 -N $2 -C "$3" -f "$1"

# Moving both private  and public keys to ~/.ssh directory
mv $1 ~/.ssh/
mv $1.pub ~/.ssh/

# Readind the content of the public key value
file_content=$(cat ~/.ssh/$public_key)

# Sending a POST request with the title and key
# DO NOT FORGET TO ESCAPE internal quotation marks
# -H is for the headers
# -d is for the actual data 
curl -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GIT_FG_TOKEN" \
    -H "X-Github-Api-Version: 2022-11-28" \
    $URL \
    -d "{\"title\":\"ssh-ed25519-darth\", \"key\":\"$file_content\"}"   

# running ssh-agent

eval "$(ssh-agent -s)"

# adding the key to ssh-agent
ssh-add ~/.ssh/$private_key