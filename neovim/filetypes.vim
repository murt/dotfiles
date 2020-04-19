"These augroups represent filetype configuration that is small enough to not
"warrant an entire plugin in ftplugins

"PRETTIER-ABLE
augroup prettier
    autocmd FileType json,jsonc,javascript,javascript.jsx,typescript,typescriptreact,yaml,css,less,sass,scss,html nnoremap FF :Prettier<CR>
augroup end

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

"TYPESCRIPT
augroup typescript
augroup end

"C#
augroup csharp
    autocmd CursorHold *.cs OmniSharpTypeLookup
    autocmd FileType cs nnoremap [omnisharp] <nop>
    autocmd FileType cs nnoremap FF :OmniSharpCodeFormat<CR>
    autocmd FIleType cs nnoremap gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nmap <leader>o [omnisharp]
    autocmd FileType cs nnoremap [omnisharp]r :OmniSharpRename<CR>
    autocmd FileType cs nnoremap [omnisharp]t :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap [omnisharp]d :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap [omnisharp]fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap [omnisharp]fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap [omnisharp]fu :OmniSharpFindUsages<CR>
augroup end
