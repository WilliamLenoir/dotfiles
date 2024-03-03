vim.cmd([[
" Find all files with related tags
function GetTags()
" get the tags line number
let r = search('\v^\s*📌\s*tags:')
" get the content of the line
let l = getline(r)
" remove the 2 first elements and get the tags
let tags = split(l)[2:-1]

" Build this search string
" \vtags:\s*(#\w+)*\s*(\#-<redshift>|\#-<tag2>)
" \v^\s*📌\s*tags:\s*(#-\w+\s*)*(\#-<architecture>|\#-<eda>)
let search = '\v^\s*📌\s*tags:\s*(#-\w+\s*)*('
let highlight = '\v('
for tag in tags[0:len(tags)-2]
let search = search . '\#-<' . tag[2:-1] . '>\s*|'
let highlight = highlight . '\#-<' . tag[2:-1] . '>\s*|'
endfor

" for the last tag don't add | at the end
let search = search . '\#-<' . tags[len(tags)-1][2:-1] . '>\s*)'
let highlight = highlight . '\#-<' . tags[len(tags)-1][2:-1] . '>\s*)'

" set the search register with this pattern
let @/=search
" use vimgrep with the @/
" debug echom @/
" debug echom "vimgrep //gj **/*.md"
vimgrep //gj **/*.md
copen

" highlight the tags
highlight wGetTagTag guifg=darkorange guibg=NONE
syntax match wGetTagTag /#-\w\+/

" highlight tags matchs
highlight wGetTagMatch guifg=darkgreen guibg=NONE
"syntax match wGetTagMatch /\v(\#-<data>|\#-<data>)/

execute "syntax match wGetTagMatch /" . highlight . "/"

" highlight all the tags #\w+
" let @/='\v#\w+' => highlight ALL the tags
let @/ = highlight " => only highlight the tags of the main file

"execute "normal! /\<cr>"

"do not work :execute "normal! /\\v#-\\w+\<cr>"
"we need to set the @/ and perform the search // with execute normal!
endfunction

function GetAllTags()
" Build this search string
let search = '\v^\s*📌\s*tags:'

" set the search register with this pattern
let @/=search

" use vimgrep with the @/
vimgrep //gj **/*.md

" highlight the tags
highlight wGetTagTag guifg=orange guibg=NONE
syntax match wGetTagTag /#-\w\+/

" highlight all the tags #\w+
" let @/='\v#-\w+' " => highlight ALL the tags
" execute "normal! /\<cr>"
endfunction

function ListTags()
" Build this search string
let search = '\v^\s*📌\s*tags:'

" set the search register with this pattern
let @/=search

" use vimgrep with the @/
vimgrep //gj **/*.md

" close the quickfixlist
cclose

" open a new buffer disposable
vert new
setlocal buftype=nofile

" insert text in the new buffer
call append(0,"📌 TAGS LIST 📖")
call append(1,"")

let n = 2
for d in getqflist()
" remove the 2 first elements and get the tags
call append(n, split(d.text)[2:-1])
let n = n + 1
endfor

" sort from line 2 to the end of te file ($)
execute "2,$!sort -u"

" color the tags
highlight wTagList guifg=orange guibg=NONE
syntax match wTagList /#-\w\+/

endfunction

" Find a file from its tag
function GoToTag(tag)
" Build this search string
" \vtags:\s*(#\w+)*\s*(\#-<redshift>|\#-<tag2>)
" \v^\s*📌\s*tags:\s*(#-\w+\s*)*(\#-<architecture>|\#-<eda>)
let search = '\v^\s*📌\s*tags:\s*(#-'. a:tag . ')'
let highlight = '\v(\#-<' . a:tag . '>)'

" set the search register with this pattern
let @/=search
" use vimgrep with the @/
" debug echom @/
" debug echom "vimgrep //gj **/*.md"
vimgrep //gj **/*.md

" highlight the tags
highlight wGetTagTag guifg=orange guibg=NONE
syntax match wGetTagTag /#-\w\+/

" highlight tags matchs
highlight wGetTagMatch guifg=lightgreen guibg=NONE
"syntax match wGetTagMatch /\v(\#-<data>|\#-<data>)/

execute "syntax match wGetTagMatch /" . highlight . "/"

" highlight all the tags #\w+
" let @/='\v#\w+' => highlight ALL the tags
" let @/ = highlight " => only highlight the tags of the main file

"execute "normal! /\<cr>"

"do not work :execute "normal! /\\v#-\\w+\<cr>"
"we need to set the @/ and perform the search // with execute normal!
endfunction

command -nargs=0 WGetTags call GetTags()
command -nargs=0 WGetAllTags call GetAllTags()
command -nargs=0 WListTags call ListTags()
command -nargs=1 WGoToTag call GoToTag(<f-args>)

]])
