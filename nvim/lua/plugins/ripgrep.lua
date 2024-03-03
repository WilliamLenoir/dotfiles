return {
  {
    "jremmen/vim-ripgrep",
    cmd = "Rg",
    keys = {
      { mode = { "n" }, "<leader>rg", "<esc>:Rg ",        desc = "Search with RipGrep",     { noremap = true } },
      { mode = { "v" }, "<leader>rz", 'y<esc>:Rg <c-r>"', desc = "Search THIS with RipGrep" },
    },
  },
}
