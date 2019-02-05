Project name:
Ffmpeg to YouTube Live (Still picture)

Description:
Stream HTTP Live Stream and still picture to YouTube Live.

Requirements:
"stream" folder must be placed in "/root"
"screen" utility
"ffmpeg" 3.3 or later
nano text editer

Installation:
Download or clone repository to /root/stream
Make scripts executable in stream/scripts
Create cronjob for /stream/scripts/log-cleanup.sh
Add aliases for shell commands to bashrc:
	alias start='bash /root/stream/scripts/start-stream.sh'
	alias stop='bash /root/stream/scripts/stop-stream.sh'
	alias restart='bash /root/stream/scripts/restart-stream.sh'
	alias edit='nano /root/stream/scripts/stream.sh'

Shell commands:
To start streaming type "start"
To stop streaming type "stop"
To restart streaming type "restart"
To edit stream settings type "edit"

Repository content:
log - stream error logs (If cronjob created, all logs except latest will be cleaned every Monday at midnight)
pic - picture for stream (Must be renamed as "1.jpg")
scripts - log-cleanup.sh (Cleans log files except last created)
	  start-stream.sh (Runs stream.sh in screen named "stream")
	  stop-stream.sh (Stops screen named "stream")
	  restart-stream.sh (Stops screen named "stream" and runs start-stream.sh)
	  stream.sh (Stream settings)

Created and tested on Ubuntu 16.04 LTS and FFmpeg 3.3
