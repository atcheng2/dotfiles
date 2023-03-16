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

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP and Autocompletion
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'andreypopp/asyncomplete-ale.vim'

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

"" Airline
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

"" ALE
" Airline Integration
let g:airline#extensions#ale#enabled = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
			\ 'c': ['clangd'],
			\ 'cpp': ['clangd']
			\ }

let g:ale_fixers = {
			\ 'c': ['clang-format'],
			\ 'cpp': ['clang-format']
			\ }

let g:ale_c_clangformat_options = '--fallback-style="microsoft"'

let g:ale_virtualtext_cursor = 'current'
let g:ale_virtualtext_delay = 0

let g:ale_sign_error = ':('
let g:ale_sign_warning = ':/'

" Let asyncomplete.vim handle autocompletion
let g:ale_completion_enabled = 0

nmap <leader>] :ALEGoToDefinition<CR>
nmap <leader>d :ALEHover<CR>
nmap <leader>r :ALEFindReferences<CR>
nmap <leader>/ :ALESymbolSearch 
nmap <leader>R :ALERename<CR>

"" Asyncomplete
" Remap <enter> to choose a autocomplete candidate
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

imap <c-@> <Plug>(asyncomplete_force_refresh)

" Ale integration
au User asyncomplete_setup
			\ call asyncomplete#register_source(
			\ asyncomplete#sources#ale#get_source_options({
			\ 'priority': 10
			\ }))

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

"" Fugitive
" Nothing yet

"" Commentary
" Nothing here

