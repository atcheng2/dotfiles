""""" Lightweight VIM configurations
""""" This file should be sourced by any .vimrc file used

""" Purist vim basic settings, note no tabreplacement ------------------------
set nocompatible number hlsearch tabstop=4 shiftwidth=4 autoindent ignorecase
set backspace=indent,eol,start

" Remove annoying beep
set visualbell t_vb=

" Don't want to always save on change buffer
set hidden

syntax on

""" Custom keystrokes --------------------------------------------------------
let mapleader = ","

" Buffer management
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>q :bp <BAR> bd #<CR>
