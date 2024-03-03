return {
  -- symbol outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>o", "<cmd>SymbolsOutline<cr>", desc = "Toogle SymbolsOutline" },
    },
    opts = {
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        goto_location = { "<Cr>", "<c-l>" },
      },
    },
  },
}
