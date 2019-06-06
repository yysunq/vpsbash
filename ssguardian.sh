#!/bin/sh
while true;do
count=`ps -A|grep ss-server`
if [ "$?" != "0" ]; then
echo "$(date "+%y-%m-%d %H:%M:%S") no ss-server, run it" >> /var/log/ssguardian.log
/etc/init.d/shadowsocks start
else
echo "$(date "+%y-%m-%d %H:%M:%S") OK" >> /var/log/ssguardian.log
fi
sleep 10
done
