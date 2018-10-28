#!/bin/bash

# Cleanup log files except latest

ls /root/stream/log/  -t | tail -n +2 | xargs rm --
