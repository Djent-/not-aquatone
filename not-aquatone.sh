#!/bin/bash

url=$1
filename=${url//\//_}
filename=${filename//:/_}

echo "$url -> $filename.txt"

# Also try google-chrome
curl --connect-timeout 5 -m 10 -vs -k "$url" > $filename.txt 2>&1 && timeout 25 chromium --headless --screenshot $url >/dev/null 2>&1 && sleep 0.5 && mv screenshot.png $filename.png && echo "$url > $filename.png"

# If you don't have chromium/chrome
#curl -vvv $line > $filename.txt 2>&1 && timeout 15 firefox --headless --screenshot $filename.png $url >/dev/null 2>&1 && echo "$url -> $filename.png"
