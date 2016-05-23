#!/bin/sh
#====================
#check stream
#====================
	stillrunning=$(ps -ef|grep "udp://@238.100.0.102:9000" | grep -v grep)
	echo ["$stillrunning"]
	if [ "$stillrunning" ];then
		echo "running"
	else
		setsid vlc -I dummy -vvv udp://@238.100.0.102:9000 --sout "#transcode{vcodec=h264,vb=256,scale=0,acodec=mpga,ab=128,channels=2,samplerate=44100}:rtp{sdp=rtsp://:8555/test}"
	fi
