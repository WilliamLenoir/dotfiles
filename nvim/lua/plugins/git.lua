return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },

    config = function()
      require("neogit").setup({

        -- by default, the views are opened in a new tab
        -- you can uncomment this part if you want a vertical split instead :

        -- kind = "vsplit",
        -- log_view = {
        --   kind = "vsplit",
        -- },

        -- signs = {
        --   -- { CLOSED, OPENED }
        --   hunk = { "", "" },
        --   item = { "⮞", "⮟" },
        --   section = { "⮞", "⮟" },
        -- },

        -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
        integrations = {
          -- If enabled, use telescope for menu selection rather than vim.ui.select.
          -- Allows multi-select and some things that vim.ui.select doesn't.
          telescope = true,
          -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
          -- The diffview integration enables the diff popup.
          --
          -- Requires you to have `sindrets/diffview.nvim` installed.
          diffview = true,
        },
        mappings = {
          popup = {
            ["?"] = "HelpPopup",
            ["A"] = "CherryPickPopup",
            ["D"] = "DiffPopup",
            ["M"] = "RemotePopup",
            ["P"] = "PushPopup",
            ["X"] = "ResetPopup",
            ["Z"] = "StashPopup",
            ["b"] = "BranchPopup",
            ["c"] = "CommitPopup",
            ["f"] = "FetchPopup",
            ["l"] = false,
            ["L"] = "LogPopup",
            ["m"] = "MergePopup",
            ["p"] = "PullPopup",
            ["r"] = "RebasePopup",
            ["v"] = "RevertPopup",
          },
        },
      })
    end,

    cmd = "Neogit",
    keys = {
      {
        mode = { "n" },
        "<leader>gr",
        function()
          require("neogit").open({ "rebase", kind = "replace" })
          vim.api.nvim_input("i")
        end,
        desc = "Git rebase interactive",
      },
      {
        mode = { "n" },
        "<leader>gl",
        function()
          require("neogit").open({ "log", kind = "replace" })
          vim.api.nvim_input("l")
        end,
        desc = "Git log",
      },
      {
        mode = { "n" },
        "<leader>gs",
        "<cmd>Neogit<cr>",
        desc = "Git status",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Gvdiffsplit", "GmasterDiff" },
    config = function()
      vim.cmd("command GmasterDiff Gvdiffsplit origin/master")
    end,
  },
}
