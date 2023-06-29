#!/bin/sh
#CentOS 7 x64

#yum -y install epel-release
#yum -y install nodejs git npm lsof
#npm install -g yarn

#git clone https://github.com/Yidadaa/ChatGPT-Next-Web
#cd ChatGPT-Next-Web
#echo 'export OPENAI_API_KEY=sk-ubAKUbHVqpiX0Z71InXghb2dCPtkjSnWM569i6Z7DX57GWCk' >> .env.local
#echo 'export BASE_URL=https://api.chatanywhere.cn' >> .env.local
#echo 'export PORT=8818' >> .env.local
#yarn install
#source ./.env.local
#yarn build

#cd ..
if [ -d "./vpsbash" ]; then
  rm -f -r ./vpsbash
fi
git clone https://github.com/yysunq/vpsbash.git
cd vpsbash
chmod a+x run.sh
cp ./mygpt.service /etc/systemd/system/
cp ./run.sh ../ChatGPT-Next-Web
systemctl enable mygpt
systemctl start mygpt

#iptables -vL --line-number
#iptables -I INPUT -p tcp --dport 8818 -j ACCEPT
#service iptables save
