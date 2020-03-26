"These augroups represent filetype configuration that is small enough to not
"warrant an entire plugin in ftplugins

"JSON
augroup json
    autocmd FileType json setlocal softtabstop=4
    autocmd FileType json setlocal shiftwidth=4
    autocmd FileType json setlocal conceallevel=0
    autocmd FileType json syntax match Comment +\/\/.\+$+
    "Filetypes that are json but don't have the extension
    autocmd BufNewFile,BufRead .babelrc setlocal ft=json
    autocmd BufNewFile,BufRead .prettierrc setlocal ft=json
augroup end

"MAKEFILE
augroup makefile
    autocmd FileType make setlocal noexpandtab
augroup end

"FISHSHELL
augroup fish
    if executable('fish')
        autocmd FileType fish compiler fish
    endif
    autocmd FileType fish setlocal textwidth=79
augroup end

"RUST
augroup rust
    autocmd FileType rust nnoremap FF :RustFmt<CR>
    autocmd FileType rust nnoremap <leader>b :FloatermNew cargo build; read; exit<CR>
    autocmd FileType rust nnoremap <leader>r :FloatermNew cargo run; read; exit<CR>
augroup end
