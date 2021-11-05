#!/bin/sh

yum install epel-release -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel -y
yum install git


#安装mbedtls
wget https://github.com/ARMmbed/mbedtls/archive/mbedtls-2.5.1.tar.gz --no-check-certificate
tar -zxvf  mbedtls-2.5.1.tar.gz
cd mbedtls-mbedtls-2.5.1
make && make check
make install
cd ..

#安装libsodium
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.17.tar.gz --no-check-certificate
tar -zxvf  libsodium-1.0.17.tar.gz
cd libsodium-1.0.17
./configure
make && make check
make install
cd ..

#安装c-ares
wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz --no-check-certificate
tar -zxvf  c-ares-1.13.0.tar.gz
cd c-ares-1.13.0
./configure
make && make check
make install
cd ..

#安装shadowsocks
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh && ./configure && make
make install
cd ..

echo '/usr/local/lib' >> /etc/ld.so.conf.d/local.conf
echo "/usr/local/lib" >> /etc/ld.so.conf
/sbin/ldconfig



#如果make出错，用下面命令configure
#./configure --with-sodium-include=/usr/local/include --with-sodium-lib=/usr/local/lib --with-mbedtls-include=/usr/local/include --with-mbedtls-lib=/usr/local/lib
