-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- reload the colors if we open neovim with an argument
require("libs.fix.colors")

-- diaslbe lsp diagnostics
-- you can enable it with <leader>ud
require("lazyvim.util").toggle.diagnostics()
