vim.cmd([[
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :windo diffoff<CR>

" scroll 2 buffers without performing a diff
" ! will toogle enabled/disabled
nnoremap <leader>dz :windo set scrollbind!<cr>

nnoremap <leader>zz :let &scrolloff=1008-&scrolloff<CR>
]])
