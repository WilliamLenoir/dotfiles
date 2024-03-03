-- WARNING: YOU HAVE TO DOWNLOAD THE COLOR PLUGIN HERE
-- and also you have to update the core.lua COLORSCHEME
return {
  {
    "robertmeta/nofrils",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nofrils_heavycomments = 1
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = { "WIndentLine" },
      },
    },
    main = "ibl",
  },
}
