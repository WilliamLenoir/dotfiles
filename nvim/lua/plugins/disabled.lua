return {
  -- Disabled plugins
  -- (don't forget to put enabled = false)
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  -- Ajoute les labels pour les recherches (inutile)
  { "folke/flash.nvim", enabled = false },

  -- TMP enabled because we want to give it a try
  -- (don't forget to put enabled = true)
  { "folke/which-key.nvim", enabled = true },

  -- I prefer to insert the closing ) or " manually
  { "echasnovski/mini.pairs", enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
}
