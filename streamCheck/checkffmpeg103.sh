#!/bin/sh
#====================
#check stream
#====================
	stillrunning=$(ps -ef|grep "rtmp://stream.wifizs.cn/live/zjtv_sd" | grep -v grep)
	echo ["$stillrunning"]
	if [ "$stillrunning" ];then
		echo "running"
	else
		setsid ffmpeg -i rtsp://10.10.70.155:8556/test -vcodec copy -acodec aac -ar 44100 -strict -2 -ac 1 -f flv -q 10 rtmp://stream.wifizs.cn/live/zjtv_sd
	fi
