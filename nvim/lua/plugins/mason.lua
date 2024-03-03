return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "black",
        "yamlfmt",
        "yaml-language-server",
      },
    },
  },
}
