#!/bin/bash

screen -S stream -X quit && sleep 5 && screen -dmS stream /root/stream/scripts/stream.sh

echo "Stream has been restarted"
