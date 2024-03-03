-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Permet de supprimer les tirets qui font office de trailing caractères
-- cf https://www.reddit.com/r/neovim/comments/15aebkd/lazyvim_unnecessary_spaces_character/
vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}

-- Spelling disabled by default
vim.opt.spell = false
-- Dictionary
vim.opt.spelllang = { "en", "fr" }
-- Add custom dictionary
-- vim.opt.spellfile = "~/.config/nvim/dico/my-dico.add"

-- required to have the conceal for the markdown titles
vim.opt.conceallevel = 2

-- load bashrc so that aliases are available in vim command line
vim.opt.shellcmdflag = "-ic"

vim.opt.clipboard = "" -- NO Sync with system clipboard

-- set lazyredraw to avoid blinking
vim.opt.lazyredraw = true

--vim.g.maplocalleader = "."

vim.opt.swapfile = false

vim.opt.path:append("**")
