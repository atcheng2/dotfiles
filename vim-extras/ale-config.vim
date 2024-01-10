""""" Installation of all linters for ALE

" No LSP integration inside ALE
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'verilog': ['verilator'],
            \ 'systemverilog': ['verilator']
            \}

let g:ale_fixers = {}


