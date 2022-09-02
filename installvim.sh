#!/bin/sh
#Ubuntu

#apt install -y vim 
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "./.vimrc" ]; then
  mv ./.vimrc ./.bak.vimrc
fi

echo "call plug#begin('~/.vim/plugged')" >> ./.vimrc
echo "  Plug 'scrooloose/nerdtree'" >> ./.vimrc
echo "  Plug 'flazz/vim-colorschemes'" >> ./.vimrc
echo "  Plug 'mhinz/vim-startify'" >> ./.vimrc
echo "call plug#end()" >> ./.vimrc

vim -c 'PlugInstall'


#echo "nnoremap <leader>n :NERDTreeFocus<CR>" >> ./.vimrc
#echo "nnoremap <C-n> :NERDTree<CR>" >> ./.vimrc
#echo "nnoremap <C-t> :NERDTreeToggle<CR>" >> ./.vimrc
#echo "nnoremap <C-f> :NERDTreeFind<CR>" >> ./.vimrc
#echo "colorscheme wombat" >> ./.vimrc
#echo "set number" >> ./.vimrc
