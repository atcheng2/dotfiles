""" Default configs-----------------------------------------------------------
so ~/.light.vim

""" Plugin Managment ---------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Plugins
call plug#begin('~/.vim/plugged')

" " Deep space colorscheme
" Plug 'tyrannicaltoucan/vim-deep-space'

" " Iceberg colorscheme
" Plug 'cocopon/iceberg.vim'

" " Hivacruz theme
" Plug 'kinoute/vim-hivacruz-theme'

" One half dark theme
Plug 'sonph/onehalf', {'rtp': 'vim'}

" Status line
Plug 'vim-airline/vim-airline'

" LSP and Autocompletion
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" File tree listing
Plug 'scrooloose/nerdtree'

" File search
Plug 'kien/ctrlp.vim'

" Git Integration
Plug 'tpope/vim-fugitive'

" Comment Lines
Plug 'tpope/vim-commentary'

call plug#end()


""" Plugin Settings ----------------------------------------------------------

"" One half dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"" Airline
let g:airline#extensions#tabline#enabled = 1

"" vim-lsp
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 100

if executable('clangd')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'clangd',
				\ 'cmd': {server_info->['clangd', '-background-index']},
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
				\ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>] <plug>(lsp-definition)
    nmap <buffer> <leader>s <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>S <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>r <plug>(lsp-references)
    nmap <buffer> <leader>i <plug>(lsp-implementation)
    nmap <buffer> <leader>t <plug>(lsp-type-definition)
    nmap <buffer> <leader>R <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"" Asyncomplete
" Remap <enter> to choose a autocomplete candidate
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ctrl+space
imap <c-@> <Plug>(asyncomplete_force_refresh)

"" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

"" Ctrl-P
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](\.(git|hg|svn)|\_site)$',
	\ 'file': '\v\.(exe\so\dll\class\png\jpg\jpeg)$'
	\ }

let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_max_files=100000

"" Fugitive
" Nothing yet

"" Commentary
" Nothing here

