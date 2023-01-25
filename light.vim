""""" Lightweight VIM configurations
""""" This file should be sourced by any .vimrc file used

""" Purist vim basic settings, note no tabreplacement ------------------------
set nocompatible number hlsearch tabstop=4 shiftwidth=4 autoindent ignorecase 
set incsearch rnu textwidth=80

" Allow deletion of newlines in insert mode
set backspace=indent,eol,start

" Remove annoying beep
set visualbell t_vb=

" Don't want to always save on change buffer
set hidden

syntax on
colorscheme desert

""" Custom keystrokes --------------------------------------------------------
let mapleader = ","

" Buffer management
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
