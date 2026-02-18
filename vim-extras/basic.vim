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

" Check for external editing of file when regaining focus.
set autoread

"" Latex filetype fix
autocmd BufReadPost,BufNewFile *.tex set filetype=tex

let g:auto_check_time_enabled = 1

function! s:ToggleableCheckTime()
  if g:auto_check_time_enabled
    silent checktime
  endif
endfunction

augroup ToggleableCheckTimeGroup
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * call s:ToggleableCheckTime()
augroup END

command! ToggleAutoCheckTime let g:auto_check_time_enabled = !g:auto_check_time_enabled | echo "Auto file checking is now" (g:auto_check_time_enabled ? "ON" : "OFF")

syntax on

" Default colorscheme
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
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

