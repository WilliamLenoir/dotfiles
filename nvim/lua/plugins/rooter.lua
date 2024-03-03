return {
  {
    "airblade/vim-rooter",
    cmd = "Rooter",
    enabled = true,
    lazzy = false, -- should be up and running
    keys = {
      { "<leader>rr", "<cmd>Rooter<cr>", desc = "Rooter" },
      { "<leader>ro", "<cmd>Rooter<cr>", desc = "Rooter" },
    },
    config = function()
      -- define the files that will create a root pattern
      vim.g.rooter_patterns = {
        ".git",
        "Makefile",
        "README.md",
      }

      -- only manual rooting with the keymap
      -- or with telescope repo extension
      vim.g.rooter_manual_only = 1

      -- we set the root in the current tab only
      vim.g.rooter_cd_cmd = "tcd"
    end,
  },
}
