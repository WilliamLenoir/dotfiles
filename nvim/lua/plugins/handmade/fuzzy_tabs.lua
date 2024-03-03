-- https://neovim.discourse.group/t/creating-a-color-picker-using-telescope/1986
-- This code comes from a series of 7 videos on how to use telescope pickers
-- to change colorschemes on neovim, here is the list:

-- video 1: https://youtu.be/vjKEKsQbQMU
-- video 2: https://youtu.be/2LSGlOgI9Cg
-- video 3: https://youtu.be/-SwYCH4Ht2g
-- video 5: https://youtu.be/Wq3wbplnxug
-- video 6: https://youtu.be/BMTXuY640dA
-- video 7: https://youtu.be/zA-VXoZ-Q8E

-- In order to mapp this function you have to map the command below:
-- :lua w_fuzzy_tabs()
--
-- Modify the list of colors or uncomment the function that takes all possible colors

local function w_fuzzy_tabs()
  local actions = require "telescope.actions"
  local actions_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local sorters = require "telescope.sorters"
  local dropdown = require "telescope.themes".get_dropdown()

  function get_tabs()
    result = {}
    local tabs = vim.api.nvim_list_tabpages()
    current_tab = vim.fn.tabpagenr()

    for _, tn in ipairs(tabs) do
      vim.cmd('silent! tabn ' .. tn)
      local pwd = vim.fn.getcwd()
      table.insert(result, { pwd, tn })
    end

    vim.cmd('tabn ' .. current_tab)


    local finder = finders.new_table {
      results = result,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end
    }

    return finder
  end

  function enter(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    --print(vim.inspect(selected))
    local tabn = selected.value[2]

    actions.close(prompt_bufnr)
    vim.cmd('tabn ' .. tabn)
  end

  function next_color(prompt_bufnr)
    actions.move_selection_next(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
  end

  function prev_color(prompt_bufnr)
    actions.move_selection_previous(prompt_bufnr)
    local selected = actions_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
  end

  -- local colors = vim.fn.getcompletion("", "color")

  local opts = {

    finder = get_tabs(),
    -- finder = finders.new_table(colors),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", enter)
      --map("i", "<C-j>", next_color)
      --map("i", "<C-k>", prev_color)
      return true
    end,

  }

  local colors = pickers.new(dropdown, opts)

  colors:find()
end

vim.g.w_fuzzy_tabs = w_fuzzy_tabs

vim.api.nvim_create_user_command('WFuzzyTabs', 'lua vim.g.w_fuzzy_tabs()', {})
