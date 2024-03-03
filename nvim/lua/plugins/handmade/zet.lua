vim.cmd([[
" @zet @ZettelKasten

" use gf to go to zet file from Zet titles list
augroup Zet
    autocmd!
    autocmd FileType zet nnoremap gf 0yiW:execute "e " . glob("./ZettelKasten/<C-r>"/*.md")<CR>
augroup END

" if it doesn't work
nnoremap gz 0yiW:execute "e " . glob("./ZettelKasten/<C-r>"/*.md")<CR>

"command -nargs=* WZetSearch execute 'vimgrep /\v(%<2l)^#\s+.*' . <f-args> . '/ ZettelKasten/**/*.md'
command -nargs=* WZetSearch call WZetSearch(<f-args>)

function WZetSearch(...)
    let search = '\v(%<2l)^#\s+.*(' . join(a:000, '|') . ')'
    execute 'noautocmd vimgrep /' . search . '/ ZettelKasten/**/*.md'
    copen
    let @/ = '\v(' . join(a:000, '|') . ')'
    execute "normal! /\<cr>"
endfunction

command -nargs=* WZetNew :call WZetNew(<f-args>)

function WZetNew(...)
    let file = system('./zet.sh "' . join(a:000, ' ') . '"')
    echom file
    execute 'e ' . file
endfunction

command -nargs=* WZetList call WZetList()

function WZetList()
    vimgrep /\v(%<2l)^#\s+.*/j ZettelKasten/**/*.md
    copen
    normal ggVGy
    cclose
    " open a new buffer disposable
    vert new
    setlocal buftype=nofile
    set filetype=zet
    call append(0, "📖 ZETTELKASTEN LIST 📖")
    normal p
    %s`\v^ZettelKasten/(.*)/.*.md.*(#)(.*)`\1 \2\3
    " remove the last line
    normal Gdd
    " jump to the beginning
    normal ggj
endfunction

command -nargs=* WZetSearchTitle call WZetSearchTitle(<f-args>)

function WZetSearchTitle(...)
    call WZetList()
    let @/ = '\v(' . join(a:000, '|') . ')'
    execute 'g!/' . @/ . '/d'
    execute "normal! /\<cr>"
endfunction

command -nargs=0 WZetWip call WZetWip()

function WZetWip()
    vimgrep /#-wip/j ZettelKasten/**/*.md
    copen
endfunction

command -nargs=0 WZetUpdate :call WZetUpdate()

function WZetUpdate()
    let output = system('./update.sh "zet update"')
    echom output
endfunction
]])
