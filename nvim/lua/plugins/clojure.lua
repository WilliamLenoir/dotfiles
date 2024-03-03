return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    -- [Optional] cmp-conjure for cmp
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end,
      },
    },
    config = function(_, opts)
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()

      vim.g["conjure#eval#inline#highlight"] = "clojure_hi"

      -- Rebind it from K to <prefix>gk
      vim.g["conjure#mapping#doc_word"] = "gk"
    end,
    init = function()
      -- Set configuration options here
      vim.g["conjure#debug"] = false
    end,
    keys = {
      {
        "<localleader>ee",
        "<cmd>ConjureEvalCurrentForm<cr>",
        desc = "clojure evaluate current form",
      },
    },
  },
}
