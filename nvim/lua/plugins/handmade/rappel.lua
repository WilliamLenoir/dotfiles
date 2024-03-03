function create_window()
  local popup = require("plenary.popup")
  local width = 60
  local height = 10

  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  local bufnr = vim.api.nvim_create_buf(false, false)

  local Harpoon_win_id, win = popup.create(bufnr, {
    title = "Info Window",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
  })

  vim.api.nvim_win_set_option(win.border.win_id, "winhl", "Normal:HarpoonBorder")

  vim.api.nvim_win_set_option(Harpoon_win_id, "number", true)
  vim.api.nvim_buf_set_name(bufnr, "window-menu")
  vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
  vim.api.nvim_buf_set_option(bufnr, "buftype", "nofile")
  vim.api.nvim_buf_set_option(bufnr, "bufhidden", "delete")

  return {
    bufnr = bufnr,
    win_id = Harpoon_win_id,
  }
end

-- @RAPPEL @HELP
function create_window_rappel()
  local win_info = create_window()
  local contents = {
    "■■ KEYS",
    "",
    "copier le buffer number du buffer courant",
    "<leader>lc",
    "--------------------------------------------------------",
    "■■ SHELL",
    "",
    "insert the result of ls",
    ":r !ls",
    "",
    "get the result of wc from the content of the file",
    ":w !wc",
    "",
    "sort the selection (ne pas utiliser ni r ni w)",
    "'<,'>sort -u",
    "--------------------------------------------------------",
    "■■ SEARCH",
    "",
    "vimgrep /\vpattern/ % : search in current file",
    "vimgrep /\vpattern/ **/* : search everywhere",
    ":Cfilter pattern",
    ":Cfilter /\vpattern/",
    "--------------------------------------------------------",

    "■■ DIFF",
    "",
    "<leader>dt : diff toutes les windows visibles",
    "<leader>do : off le diff",
    "do: get changes from other window into the current window",
    "dp: put the changes from current window into the other window",
    "]c: jump to the next change",
    "[c: jump to the previous change",
    "zo: open fold",
    "zc: close fold",
    "zr: reducing folding level",
    "zm: one more folding level, please",

    "--------------------------------------------------------",
    "■■ GIT",
    "",
    "<leader>gf + <leader>GP : :amend and push force",
    "<leader>gf : :Fix git add -A && gcam --amend --no-edit",
    "<leader>GP : :push force on the current branch",
    "",
    "fugitive : dv : diff vertical",
    "fugitive : s  : squash",
    "fugitive : cc : commit",
    "",
    "■■■ Vertical diff with master",
    ":Gdiffsplit master",
    "",
    "■■■ Merge conflict",
    "",
    ": G mergetool",
    "--------------------------------------------------------",
    "■■ TELESCOPE",
    "",
    "<leader>fr : :Fuzzy in Registers",
    "<leader>fu : :Fuzzy find in all project",
    "<leader>gg : :Live Grep",
    "<leader>:  : :Fuzzy find in commands",
    "--------------------------------------------------------",
    "■■ Veille",
    "",
    "https://old.reddit.com/r/vim/comments/yh5wrr/what_are_uncommon_but_useful_vim_commands/",
  }
  vim.api.nvim_buf_set_lines(win_info.bufnr, 0, #contents, false, contents)
end

vim.cmd([[
command -nargs=0 HELP call v:lua.create_window_rappel()
command -nargs=0 WWindowRappel call v:lua.create_window_rappel()
nnoremap <leader>ra :WWindowRappel<CR>
]])
