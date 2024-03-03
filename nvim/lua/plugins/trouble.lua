return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    keys = {
      -- show errors in the project
      -- alternative Telescope diagnostics
      {
        "<leader>xx",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "🐞 Trouble Workspace diagnostics 🐞",
      },
      -- show errors in the file
      {
        "<leader>xf",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        desc = "🐞 Trouble File diagnostics 🐞",
      },
    },
  },
}
