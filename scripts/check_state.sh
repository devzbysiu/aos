#!/usr/bin/env bash

curl -s --unix-socket "/run/user/$(id -u)/chester.sock" \
  http://chester/check/status | jq -r ".check_status"