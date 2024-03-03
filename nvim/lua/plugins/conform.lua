return {
  -- conform formates the buffer on save
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>i",
        function()
          vim.cmd("LazyFormat")
        end,
        desc = "🧹 Formate this document 🧼",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        yaml = { "yamlfmt" },
        markdown = { "prettier" },
      },
    },
  },
}
