#!/bin/bash

echo "Make sure Docker is running..."
echo "Installing application..."
docker pull ghcr.io/fevanmanshoven/docker-implicite-test-mac:main --platform linux/arm64 > /dev/null 2>&1
echo "Starting application..."
docker run -it -d -p 5560:80 --name docker-implicite-test-mac ghcr.io/fevanmanshoven/docker-implicite-test-mac:main > /dev/null 2>&1
echo "Running application..."
docker start ImpliciteTest > /dev/null 2>&1
echo "Loading..."
sleep 5
echo "Press enter to open application. Keep this open while using the app."
read -n 1 -s
open -a Safari http://localhost:5000
echo "Press enter to exit application. Keep this open while using the app."
read -n 1 -s
docker stop ocker-implicite-test-mac
