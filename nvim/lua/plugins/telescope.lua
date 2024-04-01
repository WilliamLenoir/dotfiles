local actions = require("telescope.actions")

-- search with telescope RipGrep
local function searchWithRipGrep()
  local ignore = {
    "venv",
    "cache",
    ".pytest_cache",
    "node_modules",
    ".terragrunt-cache",
    ".git",
    "lock",
  }
  require("telescope").extensions.live_grep_args.live_grep_args(
    require("telescope.themes").get_ivy({ file_ignore_patterns = ignore })
  )
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      { "<leader>tt",  "<cmd>Telescope<cr>",              desc = "Open Telescope" },
      -- not lsp dynamic seems to be better than lsp_dynamic_workspace_symbols
      -- because the fuzzy search is more tolerant
      { "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Search lsp symbol" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "🐞 Search workspace diagnostics 🐞" },
      { "<leader>:", "<cmd>Telescope commands<cr>", desc = "Search a command" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },

      -- Search with RipGrep
      {
        "<leader>pg",
        searchWithRipGrep,
        desc = "Search with RipGrep",
      },
      { "<leader>gg", searchWithRipGrep, mode = { "n" }, desc = "Search with RipGrep" },
      { "<leader>te", "<cmd>Telescope<cr>", desc = "Telescope Menu" },
      { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope oldfiles" },
      {
        mode = { "n" },
        "<leader>gs",
        false,
      },
      {
        mode = { "n" },
        "<leader><leader>",
        false,
      },
    },

    -- change some options
    opts = {
      defaults = {
        prompt_prefix = "☕  ",
        mappings = {
          n = {
            ["q"] = actions.close,
            ["jk"] = actions.close,
          },
          i = {
            ["jk"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = actions.select_default,
            ["<C-w>"] = function()
              vim.cmd([[normal! bcw]])
            end,
          },
        },
      },
      pickers = {
        builtin = {
          theme = "ivy",
        },
        diagnostics = {
          theme = "ivy",
        },
        lsp_document_symbols = {
          theme = "ivy",
        },
        lsp_workspace_symbols = {
          theme = "ivy",
        },
        lsp_dynamic_workspace_symbols = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        command_history = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        commands = {
          theme = "ivy",
        },
        find_files = {
          theme = "ivy",
        },
        git_files = {
          theme = "ivy",
        },
        live_grep_args = {
          theme = "ivy",
        },
      },

      extensions = {
        repo = {
          list = {
            fd_opts = {
              "--no-ignore-vcs",
            },
            search_dirs = {
              "~/repos/",
            },
          },
        },
      },
    },
  },
  {
    "cljoly/telescope-repo.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          -- when we use the telescope repo feature
          -- we temporary allow the auto root feature
          -- so that we can open the new repo and update the root at the same time
          -- but after, when we navigate through the files, we do not want to autoroot again
          -- this next part is handled in ../config/autocmds.lua
          -- with an autocmd based on the event DirChanged
          -- that is triggered just after the :Rooter action.
          -- At this very moment the autocmds disables again the auto rooter feature
          vim.g.rooter_manual_only = 0
          vim.cmd("Telescope repo list")
        end,
        desc = "Find Repo",
      },
    },
  },
}
