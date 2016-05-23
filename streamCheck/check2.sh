#!/bin/sh
#====================
#check stream
#====================
	stillrunning=$(ps -ef|grep "rtmp://115.231.121.138:1935/hls/ttt" | grep -v grep)
	echo ["$stillrunning"]
	if [ "$stillrunning" ];then
		echo "running"
	else
		setsid ffmpeg -i /home/zhangxiangnan/Videos/15208video_1.mp4 -vcodec copy -acodec copy -f flv rtmp://115.231.121.138:1935/hls/ttt
	fi
