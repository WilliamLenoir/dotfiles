-- Script Lua pour Neovim pour ouvrir un terminal avec 'newsboat' au démarrage
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if #vim.fn.argv() == 0 then
      -- print("Neovim a été ouvert sans argument.")
      -- Ouvre un nouveau terminal
      vim.cmd("RssOpen")
    end
  end,
})

vim.api.nvim_create_user_command("RssOpen", function()
  vim.cmd("terminal nom --config-path=$HOME/.config/nom/config.yml")
end, {})

vim.api.nvim_create_user_command("RssEdit", function()
  vim.cmd("e $HOME/.config/nom/config.yml")
end, {})
