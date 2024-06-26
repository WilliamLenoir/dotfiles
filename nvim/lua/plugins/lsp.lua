return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Those servers will be automatically installed
        -- with mason
        -- and loaded with lspconfig
        -- Tip: if you don't know the name of your lsp_server try :Mason then ctrl-f
        clojure_lsp = {},
        gopls = {},
        helm_ls = {},
        jdtls = {},
        jsonls = {},
        marksman = {},
        pyright = {},
        terraformls = {},
        tsserver = {},
        ltex = {
          filetypes = { "markdown", "text" },
          flags = { debounce_text_changes = 300 },
          language = "fr",
          additionalRules = {
            enablePickyRules = true,
            motherTongue = "fr",
          },
        },
      },
    },
    keys = {
      {
        "<leader>lq",
        "<cmd>lua vim.diagnostic.setloclist()<cr>",
        desc = "Diagnostic quickfixlist",
      },
    },
    init = function()
      -- add something
    end,
  },
}
