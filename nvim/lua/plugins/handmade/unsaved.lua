vim.cmd([[
function W_CheckUnsaved()
" open a new buffer disposable
vert new
setlocal buftype=nofile

" run ls
put=execute('ls')

" filter: get only unsaved files (marked with +)
g!/\v^\s*(\w*)\s*(\S*)\s*\+/d

" remove highlight
normal \<leader>\<leader>

" go to top and move on the filename so that we can use gf to open the file
normal gg
normal 3w
endfunction

command WCheckUnsaved call W_CheckUnsaved()
]])
