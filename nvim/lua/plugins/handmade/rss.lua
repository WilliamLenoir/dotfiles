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
  local term_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term_buf)
  vim.fn.termopen("nom --config-path=$HOME/.config/nom/config.yml")

  -- Ajoute une autocmd pour afficher une page blanche quand on quitte le RSS Reader
  -- permet d'éviter d'ouvrir les fichiers en mode split avec Neotree
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = term_buf,
    callback = function()
      vim.cmd("b#")
      -- Ferme le buffer du terminal s'il n'est plus visible
      -- vim.api.nvim_buf_delete(term_buf, { force = true })
    end,
  })
end, {})

vim.api.nvim_create_user_command("RssEdit", function()
  vim.cmd("e $HOME/.config/nom/config.yml")
end, {})
