vim.cmd([[
command WOpenInWinExplorer :!cd %:p:h && explorer.exe .<CR>
command WOpenFileInFirefox :!/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe $(wslpath -w %:p)<CR>
]])
