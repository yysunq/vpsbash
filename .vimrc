call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'flazz/vim-colorschemes'
  Plug 'mhinz/vim-startify'
call plug#end()

" nerd tree setting
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
colorscheme wombat

" default setting begin here
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 使用空格代替制表符
set expandtab

" 在行和段开始处使用制表符
set smarttab

" 显示行号
set number

" 历史记录数
set history=1000

" 搜索逐字符高亮
set hlsearch
set incsearch

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 总是显示状态行
set cmdheight=2

" 侦测文件类型
filetype on

" 字符集设定
set list
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

syntax on
set ruler
set showcmd
set whichwrap+=<,>,h,l
set autoread
set cursorline
set noeb
set confirm
set cul "高亮光标所在行
set cuc

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  

" ctags setting begin here
set tags=tags;
set autochdir

" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
" 如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "> File Name: ".expand("%")) 
        call append(line(".")+1, "> Author: sunyu") 
        call append(line(".")+2, "> Mail: yysunq@gmail.com") 
        call append(line(".")+3, "> Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
" 新建文件后，自动定位到文件末尾
endfunc 

" 光标移动到最后一行
autocmd BufNewFile * normal G



