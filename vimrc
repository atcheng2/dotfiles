""" Default configs-----------------------------------------------------------
so ~/.light.vim

""" Plugin Managment ---------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Add language servers as necessary
" function! BuildYCM(info)
" 	if a:info.status == 'installed' || a:info.force
" 		!./install.py --clangd-completer --rust-completer
" 	endif
" endfunction

"" Plugins
call plug#begin('~/.vim/plugged')

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Might switch to CoC or ALE
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'dense-analysis/ale'

" File tree listing
Plug 'scrooloose/nerdtree'

" File search
Plug 'kien/ctrlp.vim'

" C/C++ Formatting
" ALE might make this unnecessary
Plug 'rhysd/vim-clang-format'

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

let g:ale_completion_enabled = 1

nmap <leader>] :ALEGoToDefinition<CR>
nmap <leader>d :ALEHover<CR>
nmap <leader>r :ALEFindReferences<CR>
nmap <leader>/ :ALESymbolSearch 
nmap <leader>R :ALERename<CR>

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

if empty(glob('~/.vim/plugin/cscope_maps.vim'))
	silent !mkdir -p ~/.vim/plugin
	silent !wget http://cscope.sourceforge.net/cscope_maps.vim
				\ -O ~/.vim/plugin/cscope_maps.vim
endif

"" clang-format

" Format on save
autocmd FileType c ClangFormatAutoEnable

" Check for .clang-format file
let g:clang_format#deduct_style_file = 1
