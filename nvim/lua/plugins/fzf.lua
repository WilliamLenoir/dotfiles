return {
  -- we use fzf for the bqf plugin (for the quickfix list)
  {
    -- important: use the full fqdn (otherwise the plugin won't be loaded)
    "https://github.com/junegunn/fzf.vim",
    lazy = false,
  },
  {
    -- fuzzy search with z/
    "ggvgc/vim-fuzzysearch",
    lazy = false,
    config = function()
      vim.cmd([[
        " use z/ to launch a fuzzy search (replace the default methode)
        nnoremap z/ :FuzzySearch<CR>
        let g:fuzzysearch_prompt = '/'
      ]])
    end,
  },
}
