return {
  {
    "Shatur/neovim-session-manager",
    cmd = "SessionManager",
    keys = {
      { "<leader>dl", "<cmd>SessionManager load_session<cr>", desc = "💾 Session List" },
      { "<leader>ds", "<cmd>SessionManager save_current_session<cr>", desc = "💾 Session Save" },
      { "<leader>dd", "<cmd>SessionManager delete_session<cr>", desc = "💾 Session Delete" },
    },
  },
  -- we add vim-obsession because it seems to have a better integration with tmux
  -- you have to run vim -S in the folder where the Session file exist
  -- and you can use :mksession to create it
  {
    "tpope/vim-obsession",
    cmd = "Obsess",
  },
}
