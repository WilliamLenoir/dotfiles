return {
  {
    enabled = true,
    lazy = false,
    cmd = "FloatermToggle",
    "voldikss/vim-floaterm",
    keys = {
      {
        "<C-E>",
        function()
          print("hello")
          --"<Esc>A<space><Esc>pA<space>", { noremap = true }
          vim.api.nvim_input("<esc>")
          vim.api.nvim_input("A")
          vim.api.nvim_input("<space>")
          vim.api.nvim_input("<esc>")
          vim.api.nvim_input("<esc>")
          vim.api.nvim_input("p")
          vim.api.nvim_input("A")
          vim.api.nvim_input("<space>")
        end,
        mode = { "n", "t" }
      },
    },
    -- change some options
    config = function()
      local vimscript = [[
        let g:floaterm_wintype = 'split'
        let g:floaterm_autoinsert = 'false'
      ]]

      vim.cmd(vimscript)
    end,
  },
}
