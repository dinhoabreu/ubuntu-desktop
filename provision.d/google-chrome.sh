#!/usr/bin/env bash
REPO_STR="deb http://dl.google.com/linux/chrome/deb/ stable main"
REPO_FILE=/etc/apt/sources.list.d/google-chrome.list

[ -f $REPO_FILE ] && grep -q "$REPO_STR" $REPO_FILE

if [ $? -ne 0 ]; then

  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
  echo $REPO_STR > $REPO_FILE
  apt-get update -y
  apt-get install -y google-chrome-stable

fi
