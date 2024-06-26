-- We need a global variable to handle the diffview toogle
_G.is_diffview_open = false

return {
  {
    "sindrets/diffview.nvim",
    lazy = false,
    cmd = {
      "DiffviewOpen",
    },
    keys = {
      {
        mode = { "n" },
        "<leader>pr",
        function()
          if _G.is_diffview_open then
            vim.cmd("DiffviewClose")
            _G.is_diffview_open = false
          else
            -- vim.cmd("DiffviewOpen")
            vim.cmd("DiffviewOpen origin/master...HEAD")

            _G.is_diffview_open = true
          end
        end,
        desc = "Toogle Git Diffview",
      },
      {
        mode = { "n" },
        "<leader>dv",
        "<cmd>DiffviewOpen<cr>",
        desc = "DiffviewOpen (git changes)",
      },
    },
  },
}
