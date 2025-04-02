#!/bin/sh
#Ubuntu

#apt install -y vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "/root/.vimrc" ]; then
  echo "back up old .vimrc"
  mv /root/.vimrc /root/.bak.vimrc
fi

echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
echo "  Plug 'scrooloose/nerdtree'" >> ~/.vimrc
echo "  Plug 'flazz/vim-colorschemes'" >> ~/.vimrc
echo "  Plug 'mhinz/vim-startify'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc

vim +"PlugInstall | q | q"

echo "nnoremap <leader>n :NERDTreeFocus<CR>" >> ~/.vimrc
echo "nnoremap <C-n> :NERDTree<CR>" >> ~/.vimrc
echo "nnoremap <C-t> :NERDTreeToggle<CR>" >> ~/.vimrc
echo "nnoremap <C-f> :NERDTreeFind<CR>" >> ~/.vimrc
echo "colorscheme wombat" >> ~/.vimrc
echo "set number" >> ~/.vimrc
echo "set softtabstop=4" >> ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc
echo "set shiftwidth=4" >> ~/.vimrc
echo "set expandtab" >> ~/.vimrc
echo "set list" >> ~/.vimrc
