#!/usr/bin/env bash

curl -s --unix-socket "/run/user/$(id -u)/chester.sock" \
  http://chester/coverage/status | jq -r ".coverage_status"