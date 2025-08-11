#!/bin/bash

# Key is generated from your personal access tokens
# Classical token
# GIT_KEY="<YourClassicalToken>"

# Fine-grained token
GIT_FG_TOKEN="<YourFineGrainedAccessToken>"

# URL of the request
URL="https://api.github.com/user/keys"
TITLE=$4

public_key="$1.pub"
private_key="$1"


# Readind the content of the public key value
createLocalSSHKey(){
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
}

createGithubSSHKey(){
    local file_content=$(cat ~/.ssh/$public_key)
    # Sending a POST request with the title and key
    # DO NOT FORGET TO ESCAPE internal quotation marks
    # -H is for the headers
    # -d is for the actual data 
    curl -L \
        -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $1" \
        -H "X-Github-Api-Version: 2022-11-28" \
        $2 \
        -d "{\"title\":\"ssh-ed25519-$3\", \"key\":\"$file_content\"}"   
}

createLocalSSHKey $1 $2 $3
createGithubSSHKey $GIT_FG_TOKEN $URL $TITLE

# running ssh-agent
eval "$(ssh-agent -s)"

# adding the key to ssh-agent
ssh-add ~/.ssh/$private_key