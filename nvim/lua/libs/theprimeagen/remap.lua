-- Prime
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open netrw" })

--go to line + column position for a mark by default
vim.api.nvim_set_keymap("n", "'", "`", { noremap = true })

-- BuffSurf
vim.api.nvim_set_keymap("n", "<Up>", "<ESC>:silent! BufSurfForward<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<ESC>:silent! BufSurfBack<CR>", { noremap = true, silent = true })

vim.cmd([[
" Copy inside slashes
" cf. https://stackoverflow.com/questions/23666171/vim-capture-in-between-slashes

" inside /
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
" around /
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" for visual mode
" inside /
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
" around /
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" Copy inside back-slashes
" cf. https://stackoverflow.com/questions/23666171/vim-capture-in-between-slashes
" inside \
onoremap <silent> i\ :<C-U>normal! T\vt\<CR>
" around \
onoremap <silent> a\ :<C-U>normal! F\vf\<CR>

" for visual mode
xnoremap <silent> i\ :<C-U>normal! T\vt\<CR>
xnoremap <silent> a\ :<C-U>normal! F\vf\<CR>

" Copy inside dot

onoremap <silent> i. :<C-U>normal! T.vt.<CR>
onoremap <silent> a. :<C-U>normal! F.vf.<CR>

" for visual mode
xnoremap <silent> i. :<C-U>normal! T.vt.<CR>
xnoremap <silent> a. :<C-U>normal! F.vf.<CR>

nnoremap cw ciw
nnoremap vw viw
nnoremap dw diw
nnoremap yw yiw

nnoremap cp cip
nnoremap vp vip
"nnoremap dp dip "conflict with diff mapings
nnoremap yp yip

" break point pour undo
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Undo et redo
noremap u <Nop>
noremap U <Nop>

noremap <c-z> u

" copy in system clipboard
vnoremap <C-c> "+y

" escape with space bar
nnoremap <leader><leader> <Esc>:noh<CR>
vnoremap <leader><leader> <Esc>:noh<CR>
]])

-- Tabs
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>kt", "<cmd>tabclose<cr>", { desc = "Close Tab", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tg", "gT", { desc = "Previous Tab", noremap = true, silent = true })
-- fuzzy tabs custom plugin
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>WFuzzyTabs<cr>", { desc = "Fuzzy tab", noremap = true, silent = true })

-- change working directory to the current file
-- then use <leader>E (capital E) to have the neotree view
vim.api.nvim_set_keymap(
  "n",
  "<leader>rf",
  "<cmd>tcd %:p:h<cr><cmd>pwd<cr>",
  { desc = "Root to this file", noremap = true, silent = true }
)

-- Working directory
vim.api.nvim_set_keymap("n", "<leader>pp", "<cmd>pwd<cr>", { desc = "pwd", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>ls<cr>", { desc = "ls", noremap = true, silent = true })

-- Feature :
-- ne pas supprimer la ligne précéndente avec <c-w> quand on arrive au début de la ligne courrante
vim.cmd([[
" Fonction personnalisée pour surcharger <C-w> en mode insertion
function! SmartBackspace()
    " Vérifie si le curseur est au début de la ligne
    if col('.') == 1
        " Optionnel : supprime le caractère actuel si non désiré, sinon ne fait rien
        " return "\<Del>"
        return ""
    else
        " Exécute l'action normale de <C-w>
        return "\<C-w>"
    endif
endfunction

" Mappe la touche <C-w> en mode insertion à notre fonction personnalisée
inoremap <silent><C-w> <C-r>=SmartBackspace()<CR>
]])

-- Feature :

-- problème, si on ne fait pas echap lors de la saisie de texte
-- il n'y a pas de point d'undo qui se crée et si on doit undo
-- cela nous supprime tout notre paragraphe

-- INFO: <C-g>u crée un point de sauvegarde dans l'historique d'undo

-- les mappings suivants insèrent automatiquement un point d'undo après chaque espace ou ponctuation,
-- ce qui rend l'annulation mot par mot plus intuitive avec la commande undo
vim.cmd([[
inoremap <Space> <Space><C-g>u
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
]])
