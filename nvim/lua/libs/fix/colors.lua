-- Reload the colors just in case we may have an issue on startup
vim.cmd("so ~/.config/nvim/lua/config/autocmds.lua")

-- Deprecated
-- sometimes it doesn't work so we prefer to run it every time

-- if #vim.v.argv >= 5 then
--   vim.cmd("so ~/.config/nvim/lua/config/autocmds.lua")
-- end
