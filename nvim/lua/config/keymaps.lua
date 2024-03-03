-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Default Keymaps Deleted
-- Ensure to call this at the beginning
vim.keymap.del("n", "<leader>ft")

require("libs.theprimeagen.remap")
require("libs.theprimeagen.quickfix")

--FIX: when we have an argument : nvim file1
-- the colors are overrided
-- tmp fix : manually use <leader>co to re-source the autocmds.lua file with the hi
vim.api.nvim_set_keymap(
  "n",
  "<leader>co",
  "<cmd>so ~/.config/nvim/lua/config/autocmds.lua<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>jk", "<ESC><C-w>c", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ka", "<Esc>:qa!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>kk", "<Esc>:qa<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vv", ":noautocmd vimgrep ``j **/*<LEFT><LEFT>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<tab>", "<c-^>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "fd", "<Esc>:silent! wa<CR>", { noremap = true, silent = true })

-- do not move to the top of the block when yanking in visual mode
-- cf. https://stackoverflow.com/questions/3806629/yank-a-region-in-vim-without-the-cursor-moving-to-the-top-of-the-block
vim.api.nvim_set_keymap("v", "y", "ygv<esc>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>vf", "Va{", { noremap = false })

-- Terminal

-- Escape insert mode with jk in the terminal (not jj to be able to scroll in logs)
vim.cmd("tmap jk <Esc><Esc>")
vim.cmd("tmap <C-k> <Esc><C-w>k")
vim.cmd("tmap <C-l> <Esc><C-w>l")
vim.cmd("tmap <C-j> <Esc><C-w>j")
vim.cmd("tmap <esc> jk") -- avoid to type escape two times
vim.cmd("tnoremap jj <down><down>") -- for scrolling in git log but it is better to use capital J instead
vim.cmd("nnoremap   <silent>   <C-n> :FloatermToggle<CR>")
vim.cmd("tmap       <silent>   <C-n> jk:FloatermToggle<CR>")

-- Spelling

vim.api.nvim_set_keymap("n", "ze", "z=1<cr><cr>", { desc = "Fix spelling mistake" })
-- go to next/prev word to fix
vim.api.nvim_set_keymap("n", "zn", "]s", { desc = "next spelling mistake" })
vim.api.nvim_set_keymap("n", "zN", "[s", { desc = "previous spelling mistake" })
vim.api.nvim_set_keymap("n", "ZN", "[s", { desc = "previous spelling mistake" }) -- easier to type
vim.api.nvim_set_keymap("n", "<leader>sp", "<cmd>set spell!<cr>", { desc = "toogle spell checker" }) -- easier to type

-- Toggle Transparent Background
vim.api.nvim_set_keymap(
  "n",
  "<leader>bg",
  "<cmd>ToggleTransparentBackground<cr>",
  { desc = "toogle transparent background" }
) -- for readability

-- Git
vim.api.nvim_set_keymap("n", "<leader>re", "<cmd>!cd %:p:h && git restore %<cr>", { desc = "Git restore current file" })

vim.cmd([[

function! WCopyBranchName()
let branch = system("git branch --show-current 2> /dev/null | tr -d '\n'")
let @" = branch

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    call system(s:clip, @0)
endif
echom branch
endfunction



command -nargs=0 Fix :!git add -A ; git commit -a --amend --no-edit

nnoremap <leader>cb :call WCopyBranchName()<CR>

nnoremap <leader>gu <ESC>:G fetch -a<CR>
nnoremap <leader>gf :silent! wa<CR>:Fix<CR>
nmap <leader>gp <ESC><leader>cb<ESC>:!git push origin <C-R>" -f<CR>
nmap <leader>GP <ESC><leader>cb<ESC>:!git push origin <C-R>" -f<CR>

]])

-- Do not modify the current cursor position when search with * wildcard
vim.api.nvim_set_keymap("n", "*", "mn*`n", { desc = "search", noremap = true })

-- Do not launch a macro recording by mistake
-- Désactiver 'q' pour l'enregistrement de macro mais permettre 'q:' pour l'historique des commandes
local letters = {
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
}

for _, letter in ipairs(letters) do
  vim.api.nvim_set_keymap("n", "q" .. letter, "<Nop>", { noremap = true })
end

-- center the search results
-- vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
-- vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
