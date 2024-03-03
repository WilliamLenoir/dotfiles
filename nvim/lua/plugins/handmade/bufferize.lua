vim.cmd([[
command -nargs=* Bufferize call WBufferize(<f-args>)
command -nargs=* WBufferize call WBufferize(<f-args>)

function WBufferize(command)
    "open a disposable buffer
    vert new
    enew
    execute "put=execute('" . a:command . "')"
endfunction
]])
