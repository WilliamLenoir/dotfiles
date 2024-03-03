vim.cmd([[
command WPKIdecodeCertificateShell :w !openssl x509 -text -noout
command WPKIdecodeCertificateBuffer call WPKIdecodeCertificateBuffer()

function WPKIdecodeCertificateBuffer()
    normal ggVGy
    " open a new buffer disposable
    vert new
    setlocal buftype=nofile

    normal p

    " run openssl
    put=execute('w !openssl x509 -text -noout')
    normal gg
endfunction
]])
