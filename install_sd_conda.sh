#!/bin/sh
#ubuntu 20.4 x64
apt update -y
apt install htop vim tmux git curl wget -y

#设置conda
#中科大源
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/
conda config --set show_channel_urls yes

#清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --set show_channel_urls yes

echo 'envs_dirs:' >> ~/.condarc
echo '  - /root/autodl-tmp/Miniconda_envs' >> ~/.condarc
echo 'pkgs_dirs:' >> ~/.condarc
echo '  - /root/autodl-tmp/Miniconda_pkgs' >> ~/.condarc

#设pip置阿里镜像源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip config set install.trusted-host https://mirrors.aliyun.com

#设置pip缓存目录
pip config set global.cache-dir "/root/autodl-tmp/.cache/pip"

#设置huggingface缓存目录
vim ~/.bashrc
echo 'TRANSFORMERS_CACHE="/root/autodl-tmp/.cache/huggingface"' >> ~/.bashrc
