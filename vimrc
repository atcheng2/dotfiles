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

" ALE integration
let g:airline#extensions#ale#enabled = 1

"" YCM
" let g:ycm_complete_in_comments_and_strings=1
" let g:ycm_key_list_select_completion=['<C-n>', '<TAB>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<S-TAB>']
" let g:ycm_autoclose_preview_window_after_completion=1
" 
" " Remove automatic completion popup
" let g:ycm_min_num_of_chars_for_completion = 99
" 
" " Remove all diagnostics
" " let g:ycm_show_diagnostics_ui=0
" 
" " GoTo and Documentation
" " nmap <C-]> :YcmCompleter GoTo<CR>
" nmap <leader>] :YcmCompleter GoTo<CR>
" let g:ycm_auto_hover=''
" nmap <leader>d <plug>(YCMHover)
" 
" set completeopt-=preview

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
