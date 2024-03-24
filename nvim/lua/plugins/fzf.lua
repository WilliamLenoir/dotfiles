return {
  -- we use fzf for the bqf plugin (for the quickfix list)
  {
    -- important: use the full fqdn (otherwise the plugin won't be loaded)
    "https://github.com/junegunn/fzf.vim",
    lazy = false,
  },
  {
    -- fuzzy search with /
    "ggvgc/vim-fuzzysearch",
    lazy = false,
    config = function()
      vim.cmd([[
        " use / to launch a fuzzy search (replace the default methode)
        nnoremap / :FuzzySearch<CR>
        " use g/ to use the standard search
        nnoremap g/ /
        let g:fuzzysearch_prompt = '/'
      ]])
    end,
  },
}
