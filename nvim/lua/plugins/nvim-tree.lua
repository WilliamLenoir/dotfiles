local function my_on_attach_tree(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "zR", api.tree.expand_all, opts("Help"))
  vim.keymap.set("n", "zM", api.tree.collapse_all, opts("Help"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Help"))
  vim.keymap.set("n", "h", api.node.navigate.parent, opts("Help"))
end

return {
  -- change NeoTree config
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    keys = {
      {
        "<leader>pe",
        "<cmd>NvimTreeToggle<cr>",
        desc = "Explorer Nvim-Tree (Focus)",
      },
    },
    -- opts will be merged with the parent spec

    init = function() end,

    opts = {
      --open_on_tab = false,
      sync_root_with_cwd = false,
      respect_buf_cwd = true, -- IMPORTANT
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
      },
      disable_netrw = false,
      hijack_netrw = true,
      -- deprecated https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
      --ignore_ft_on_setup = { "alpha" },
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false,
        update_cwd = false,
      },
      on_attach = my_on_attach_tree,
      view = {
        adaptive_size = true,
        side = "right",
        width = 25,
        centralize_selection = true,
        relativenumber = true,
        --     float = {
        --         enable = true,
        --     },
      },
      git = {
        enable = true,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        special_files = {},
        highlight_git = true,
        --highlight_opened_files = "all",

        indent_markers = {
          enable = true,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
            },
            --             git = {
            --                unstaged = "✗",
            --                staged = "✓",
            --                unmerged = "",
            --                renamed = "➜",
            --                untracked = "★",
            --                deleted = "",
            --                ignored = "◌",
            --             },
          },
        },
      },
      hijack_directories = {
        enable = false,
        auto_open = false,
      },
    },
  },
}
