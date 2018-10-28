#!/bin/bash

image=/root/stream/pic/1.jpg #path to picture
source= #stream source
youtube_url=rtmp://a.rtmp.youtube.com/live2
youtube_key=

###########################################################

until FFREPORT=file=/root/stream/log/stream-%t.log:level=24 ffmpeg \
	-thread_queue_size 1024 \
	-err_detect ignore_err -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 3600 -i $source \
	-re -loop 1 -i $image \
	-acodec libfdk_aac -b:a 128k -ar 44100 \
	-vcodec libx264 -preset ultrafast -tune stillimage -pix_fmt yuv420p -r 30 -g 60 -crf 8 -maxrate 4500k -bufsize 6000k \
	-s 1920x1080 \
	-f flv -flvflags no_duration_filesize \
	$youtube_url/$youtube_key; do
	echo "Something happened. Stream will be restarted after 5 seconds"
	sleep 5
done
