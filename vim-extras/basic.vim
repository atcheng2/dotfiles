""""" Lightweight VIM configurations
""""" This file should be sourced by any .vimrc file used

""" Purist vim basic settings, note no tabreplacement --------------------------
set nocompatible number hlsearch tabstop=8 shiftwidth=4 autoindent ignorecase 
set incsearch rnu textwidth=80 colorcolumn=81,101 fo-=t scrolloff=5 expandtab
set smarttab

" Disable commands that start with <esc> in insert mode
set noek

" Re-enable formatting 80 char limit for md and txt files
autocmd BufRead,BufNewFile *.txt,*.md,*.rst set fo+=t 

" Allow deletion of newlines in insert mode
set backspace=indent,eol,start

" Remove annoying beep
set visualbell t_vb=

" Don't want to always save on change buffer
set hidden

" Mouse support is not your friend :/
set mouse=

syntax on

" Default colorscheme
set termguicolors
set background=dark
colorscheme desert

" Make the popup menu color softer
highlight Pmenu ctermbg=gray guibg=gray

""" Custom keystrokes ----------------------------------------------------------
let mapleader = ","

" Buffer management
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>q :bp <BAR> bd #<CR>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L>
		\ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

