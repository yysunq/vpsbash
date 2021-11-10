#!/bin/sh
#CentOS 7 x64
yum update

yum install epel-release -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel -y
yum install git
yum install wget

#安装mbedtls
if [ -f "mbedtls-2.5.1.tar.gz" ]; then
  rm -f mbedtls-2.5.1.tar.gz
fi
if [ -d "./mbedtls-mbedtls-2.5.1" ]; then
  rm -f -r ./mbedtls-mbedtls-2.5.1
fi
wget https://github.com/ARMmbed/mbedtls/archive/mbedtls-2.5.1.tar.gz --no-check-certificate
tar -zxvf  mbedtls-2.5.1.tar.gz
cd mbedtls-mbedtls-2.5.1
make
make install
cd ..

#安装libsodium
if [ -f "libsodium-1.0.17.tar.gz" ]; then
  rm -f libsodium-1.0.17.tar.gz
fi
if [ -d "./libsodium-1.0.17" ]; then
  rm -f -r ./libsodium-1.0.17
fi
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.17.tar.gz --no-check-certificate
tar -zxvf  libsodium-1.0.17.tar.gz
cd libsodium-1.0.17
./configure
make && make check
make install
cd ..

#安装c-ares
if [ -f "c-ares-1.13.0.tar.gz" ]; then
  rm -f c-ares-1.13.0.tar.gz
fi
if [ -d "./c-ares-1.13.0" ]; then
  rm -f -r ./c-ares-1.13.0
fi
wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz --no-check-certificate
tar -zxvf  c-ares-1.13.0.tar.gz
cd c-ares-1.13.0
./configure
make && make check
make install
cd ..

#安装shadowsocks
if [ -d "./shadowsocks-libev" ]; then
  rm -f -r ./shadowsocks-libev
fi
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh && ./configure && make
make install
cd ..

echo '/usr/local/lib' >> /etc/ld.so.conf.d/local.conf
echo "/usr/local/lib" >> /etc/ld.so.conf
/sbin/ldconfig

#安装ifconfig
yum install net-tools.x86_64 
yum install crontabs

#打开防火墙端口
firewall-cmd --zone=public --add-port=8816/tcp --permanent 
firewall-cmd --zone=public --add-port=8525/tcp --permanent 
firewall-cmd --reload
firewall-cmd --zone=public --list-all
systemctl status firewalld
#如果make出错，用下面命令configure
#./configure --with-sodium-include=/usr/local/include --with-sodium-lib=/usr/local/lib --with-mbedtls-include=/usr/local/include --with-mbedtls-lib=/usr/local/lib

if [ -d "./vpsbash" ]; then
  rm -f -r ./vpsbash
fi
git clone https://github.com/yysunq/vpsbash.git
cd vpsbash
chmod a+x shadowsocks
chmod a+x ssguardian.sh

#重启自动开启
cp ./shadowsocks /etc/init.d/
echo "/etc/init.d/shadowsocks start" >> /etc/rc.d/rc.local
chmod a+x /etc/rc.d/rc.local

#配置crontab
cp ./ssguardian.sh /usr/local/bin
echo "0 6 * * * /sbin/reboot" >> /var/spool/cron/root
echo "*/5 * * * * /usr/local/bin/ssguardian.sh" >> /var/spool/cron/root
service crond restart
crontab -l

#启动一个实例
./shadowsocks start
ps -ef |grep /usr/local/bin/ss-server |grep -v "grep" |wc -l