vim.api.nvim_create_user_command('WToggleAutoformat',
  function()
    -- par défaut vim.b.autoformat est à nil
    -- si nil alors il autoformat
    if vim.b.autoformat == nil or vim.b.autoformat == true then
      -- désactiver
      vim.b.autoformat = false
    else
      -- reactiver
      vim.b.autoformat = true
    end
  end,
  { nargs = 0 })

-- call with vim.cmd.WToggleAutoformat()
