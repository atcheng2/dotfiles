""" Default configs-----------------------------------------------------------
ru extras/basic.vim

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

" One half themes
Plug 'sonph/onehalf', {'rtp': 'vim'}

" Status line
Plug 'vim-airline/vim-airline'

" LSP and Autocompletion
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Linting
Plug 'dense-analysis/ale'

" File tree listing
Plug 'scrooloose/nerdtree'

" File search
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}

" Git Integration
Plug 'tpope/vim-fugitive'

" Comment Lines
Plug 'tpope/vim-commentary'

" Check health!
Plug 'rhysd/vim-healthcheck'

call plug#end()


""" Plugin Settings ----------------------------------------------------------

"" Airline
let g:airline#extensions#tabline#enabled = 1

"" vim-lsp
let g:lsp_diagnostics_signs_error = {'text': ':('}
let g:lsp_diagnostics_signs_warning = {'text': ':/'}

let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 100

let g:lsp_signature_help_delay = 100

ru extras/lsp-servers.vim

"" Asyncomplete
" Remap <enter> to choose a autocomplete candidate
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ctrl+space
imap <c-@> <Plug>(asyncomplete_force_refresh)

"" ALE
ru extras/ale-config.vim

"" Nerdtree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

let g:NERDTreeWinPos = "right"

"" FZF
nmap <C-p> :FZF<CR>

"" Fugitive
" Nothing yet

"" Commentary
" Nothing here

