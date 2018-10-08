#!/bin/bash

 
. ./common.sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

GOOGLECHROMEREPO=/etc/yum.repos.d/google-chrome.repo
# -----------------------------------------------------------
(
cat <<'84773676-9882-45ba-9d67-69f03a107d8c'
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
84773676-9882-45ba-9d67-69f03a107d8c
) > $GOOGLECHROMEREPO
# -----------------------------------------------------------

echo Installing Google Chrome Stable

$INSTALLER install -y \
    google-chrome-stable
