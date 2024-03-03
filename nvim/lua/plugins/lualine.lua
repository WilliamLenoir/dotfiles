local function get_basename(path)
  return path:match("([^/\\]+)$")
end

local function is_current_file_in_cwd()
  -- Obtenez le chemin complet du fichier actuellement ouvert
  local current_file = vim.fn.expand("%:p")
  local in_cwd = nil

  if current_file == "" then
    -- Do nothing, leave the highlight unchanged
    return
  end

  -- Obtenez le répertoire de travail courant
  local cwd = vim.fn.getcwd()

  -- Vérifiez si le fichier actuel commence par le chemin du répertoire de travail courant
  if current_file:sub(1, #cwd) == cwd then
    --print("Le fichier courant est dans le répertoire de travail courant.")
    in_cwd = true
  else
    --print("Le fichier courant n'est PAS dans le répertoire de travail courant.")
    in_cwd = false
  end

  if in_cwd then
    vim.cmd("highlight WAirlineCwd guibg=#50a14f")
  else
    vim.cmd("highlight WAirlineCwd guibg=orange")
  end
end

local function emoji()
  return "😺"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "onelight",
      },
      sections = {
        lualine_a = {
          --emoji,
          {
            "mode",
            fmt = function(str)
              if str == "NORMAL" then
                return "𝐍"
              elseif str == "INSERT" then
                return "𝐈"
              elseif str == "REPLACE" then
                return "𝐑"
              elseif str == "COMMAND" then
                return "𝐂"
              elseif str == "VISUAL" then
                return "𝐕"
              elseif str == "V-LINE" then
                return "𝐕"
              elseif str == "O-PENDING" then
                return "𝐂"
              else
              end
            end,
          },
        },

        lualine_c = {
          {
            "filename",
            path = 1, -- show the full path name ; remove this line to have the filename only
          },
        },

        lualine_z = {
          {
            function()
              local current_dir = vim.fn.getcwd()
              local last_part = get_basename(current_dir)
              is_current_file_in_cwd()
              return "😺 " .. last_part
            end,
            --color = { bg = "red", fg = "#0A0A0A", gui = "none" },
            color = "WAirlineCwd",
            section_separators = { left = "", right = "" },
          },
          { "encoding" },
          { "searchcount" },
          { "selectioncount" },
        },
      },
    },
  },
}
