vim.cmd([[
" open the :Man page of a specific cmd and search for the line related to a specific flag
" example: to obtain the manual line related to the cmd du -h
" run WGetCmdFlagManual("du", "s")
function WGetCmdFlagManual(cmd, flag)
echom a:cmd
echom a:flag
execute "Man " . a:cmd
execute "normal/\Man " . a:cmd
let search = '\v^\s*-' . a:flag
let @/=search
execute "normal! /\<cr>"
endfunction

" call the WGetCmdFlagManual() function
" example: to obtain the manual line related to the cmd du -h
" run :WGetCmdFlagManual du s           (quotes are not required)
" or run :WGetCmdFlagManual "du" "s"
command -nargs=* WGetCmdFlagManual call WGetCmdFlagManual(<f-args>)

]])
