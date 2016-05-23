#!/bin/sh
#====================
#check stream
#====================
	stillrunning=$(ps -ef|grep "rtsp://:8554/test" | grep -v grep)
	echo ["$stillrunning"]
	if [ "$stillrunning" ];then
		echo "running"
	else
		setsid vlc -I dummy -vvv /home/zhangxiangnan/Videos/15208video_1.mp4 --sout "#transcode{vcodec=h264,vb=256,scale=0,acodec=mpga,ab=128,channels=2,samplerate=44100}:rtp{sdp=rtsp://:8554/test}"
	fi
