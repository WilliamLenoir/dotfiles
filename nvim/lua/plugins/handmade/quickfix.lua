vim.cmd([[
" clear the quickfixlist
" just type :cc and then <TAB> to autocomplete
function ClearQuickfixList()
call setqflist([])
endfunction

command! Cclear call ClearQuickfixList()
]])
