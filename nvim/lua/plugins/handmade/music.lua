vim.cmd([[
command -nargs=0 WMusic :call WMusic()

function! WMusic()
    "let music_url = 'https://www.youtube.com/watch?v=Mbym7rIR7sc&list=PLOEAs04auvietkxFG-8hjc80IIVBItX2r&index=56'
    let music_url = 'https://www.youtube.com/watch?v=eMTFVLjD4U8'
    let cmd = '/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe ' .. music_url
    call system(cmd)
endfunction

]])
