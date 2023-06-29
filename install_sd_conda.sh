#!/bin/sh
#ubuntu 20.4 x64
apt update -y
apt upgrade -y
apt install vim tmux git curl wget glances shadowsocks-libev lsof -y

#set conda 
#ustc mirror
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/
conda config --set show_channel_urls yes

#tinghua mirror
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --set show_channel_urls yes

echo 'envs_dirs:' >> ~/.condarc
echo '  - /root/autodl-tmp/Miniconda_envs' >> ~/.condarc
echo 'pkgs_dirs:' >> ~/.condarc
echo '  - /root/autodl-tmp/Miniconda_pkgs' >> ~/.condarc

#pip mirrors set
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip config set install.trusted-host https://mirrors.aliyun.com

#pip cache set
pip config set global.cache-dir "/root/autodl-tmp/.cache/pip"

#huggingface cache set
echo 'TRANSFORMERS_CACHE="/root/autodl-tmp/.cache/huggingface"' >> ~/.bashrc
