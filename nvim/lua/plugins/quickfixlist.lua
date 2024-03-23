return {
  -- allow to edit the quickfixlist
  {
    "itchyny/vim-qfedit",
  },
  -- improve the quickfix list UI
  -- NOTE: do not install the reflector plugin, both are exclusive
  {
    "kevinhwang91/nvim-bqf",
    dependencies = { "junegunn/fzf" },
    opts = {
      preview = {
        auto_preview = false,
        winblend = 0,
      },
    },
  },
}
