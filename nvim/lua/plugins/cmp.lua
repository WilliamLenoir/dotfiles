local cmp = require("cmp")
local luasnip = require("luasnip")

local my_mapping = cmp.mapping.preset.insert({
  ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<S-CR>"] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<C-CR>"] = function(fallback)
    cmp.abort()
    fallback()
  end,

  -- Custom
  ["<C-j>"] = cmp.mapping(function(_)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.jumpable(1) then
      luasnip.jump(1)
    else
      cmp.complete()
    end
  end, { "i", "s", "c" }),

  ["<C-k>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s", "c" }),

  ["<C-l>"] = cmp.mapping(function(_)
    cmp.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    --cmp.abort()
    --cmp.complete()
  end, { "i", "s", "c" }),

  -- INFO: Utiliser enter uniquement pour les sauts de ligne
  -- CR pour cmp est désactivé
  -- il faut impérativement appeler fallback() pour que le saut de ligne soit effectué
  ["<CR>"] = function(fallback)
    if cmp.visible() then
      cmp.abort()
    end
    fallback() -- IMPORTANT sinon le saut de ligne n'est pas effectué
  end,
  -- INFO: Même chose pour <c-y> qui est utilisé pour copier la ligne du haut
  ["<c-y>"] = function(fallback)
    if cmp.visible() then
      cmp.abort()
    end
    fallback() -- IMPORTANT sinon le saut de ligne n'est pas effectué
  end,
})

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- Custom
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
    opts = {
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            keyword_length = 1,
            -- get completion from ALL buffers
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        {
          name = "path",
          option = {
            trailing_slash = true,
          },
        },
        { name = "fuzzy_path" },
      }),

      preselect = cmp.PreselectMode.None,
      mapping = my_mapping,
    },

    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      cmp.setup(opts)

      -- Custom

      cmp.setup.cmdline(":", {
        sources = {
          -- {
          --   name = "cmdline",
          --   option = {
          --     ignore_cmds = { "Man", "!", "find", "e" },
          --   },
          -- },
          {
            name = "path",
          },
        },
      })

      cmp.setup.cmdline("/", {
        sources = {
          {
            name = "buffer",
            option = {
              keyword_length = 1,
              -- get completion from ALL buffers
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        },
      })

      cmp.setup.cmdline("?", {
        sources = {
          {
            name = "buffer",
            option = {
              keyword_length = 1,
              -- get completion from ALL buffers
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        },
      })
    end,
  },
}
