vim.cmd([[

" @scratch @brouillon
command -nargs=0 WScratch call Scratch()

let g:scratch_number = 1

function Scratch()
"let date = system("date +'%Y-%m-%d-%Hh%M'")
let date = strftime("%Y-%m-%d-%Hh%M")
execute 'vert new $HOME/vim_scratch/' . date . '_' . g:scratch_number . '.md'
"setlocal buftype=nofile
set filetype=markdown
"execute 'file scratch_' . g:scratch_number

" insert text in the new buffer
call append(0,"✏️  SCRACTH #" . g:scratch_number )
call append(1,"DATE:" . date)
call append(2,"")
let g:scratch_number = g:scratch_number + 1

endfunction
]])
