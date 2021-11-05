#!/bin/sh
count=`ps -ef |grep /usr/local/bin/ss-server |grep -v "grep" |wc -l`
if [ $count -eq 0 ]; then
	echo "$(date "+%y-%m-%d %H:%M:%S") no ss-server, run it" >> /var/log/ssguardian.log
	/etc/init.d/shadowsocks start
else
	echo "$(date "+%y-%m-%d %H:%M:%S") test success already run" >> /var/log/ssguardian.log
fi
