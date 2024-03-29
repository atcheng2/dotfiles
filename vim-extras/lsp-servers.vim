""""" Installation of all language servers via vim-lsp

""" Language servers -----------------------------------------------------------
if executable('clangd')
    au User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd', '--background-index']},
		\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
		\ })
endif

if executable('pylsp')
    au User lsp_setup call lsp#register_server({
		\ 'name': 'pylsp',
		\ 'cmd': {server_info->['pylsp']},
		\ 'allowlist': ['python'],
		\ })
endif

if executable('svlangserver')
    au User lsp_setup call lsp#register_server({
		\ 'name': 'svlang',
		\ 'cmd': {server_info->['svlangserver']},
		\ 'allowlist': ['verilog', 'systemverilog'],
		\ })
endif

""" Installation function ------------------------------------------------------
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>] <plug>(lsp-definition)
    nmap <buffer> <leader>s <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>/ <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>r <plug>(lsp-references)
    nmap <buffer> <leader>i <plug>(lsp-implementation)
    nmap <buffer> <leader>t <plug>(lsp-type-definition)
    nmap <buffer> <leader>R <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>d <plug>(lsp-hover)
    nmap <buffer> <leader>f <plug>(lsp-document-range-format)
    vmap <buffer> <leader>f <plug>(lsp-document-range-format)
    nmap <buffer> <leader>F <plug>(lsp-document-format)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

