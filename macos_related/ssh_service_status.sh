#!/bin/bash

REMOTE_SERVER="$(ipconfig getifaddr en0)"

# Check if the SSH service (Remote Login) is enabled
if systemsetup -getremotelogin | grep -q "On"; then
    echo "SSH service is running on $REMOTE_SERVER"
else
    echo "SSH service is not running on $REMOTE_SERVER"
fi
