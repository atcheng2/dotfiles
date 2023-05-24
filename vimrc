""" Default configs-----------------------------------------------------------
ru extras/light.vim

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

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

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

"" One half dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

"" Airline
let g:airline#extensions#tabline#enabled = 1

"" vim-lsp
let g:lsp_diagnostics_signs_error = {'text': ':('}
let g:lsp_diagnostics_signs_warning = {'text': ':/'}

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 100

let g:lsp_signature_help_delay = 100

ru extras/lsp-servers.vim

"" Asyncomplete
" Remap <enter> to choose a autocomplete candidate
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ctrl+space
imap <c-@> <Plug>(asyncomplete_force_refresh)

"" vsnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

"" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

"" FZF
nmap <C-p> :FZF<CR>

"" Fugitive
" Nothing yet

"" Commentary
" Nothing here

