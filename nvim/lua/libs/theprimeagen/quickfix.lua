-- Function to toogle the quickfix window
vim.api.nvim_create_user_command("ToggleQuickFix", function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end

  vim.cmd("copen")
end, {})

-- Quick list
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>ToggleQuickFix<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Left>", "<ESC>:cprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<ESC>:cnext<CR>", { noremap = true, silent = true })
