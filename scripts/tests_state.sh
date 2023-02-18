#!/usr/bin/env bash

curl -s --unix-socket "/run/user/$(id -u)/chester.sock" \
  http://chester/tests/status | jq -r ".tests_status"