return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "id",
        indicator = {
          icon = "",
          style = "icon",
        },
      },
      highlights = {
        fill = {
          fg = "white",
          bg = "black",
        },
        background = {
          fg = "#9e9e9e", -- = la couleur des buffers filenames !
        },
        tab = {
          fg = "#9e9e9e",
        },
        tab_selected = {
          fg = "black",
          bold = true,
          underline = true,
        },
        --        tab_separator = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        tab_separator_selected = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          sp = "<colour-value-here>",
        --          underline = "<colour-value-here>",
        --        },
        tab_close = {
          fg = "black",
        },
        close_button = {
          fg = "black",
        },
        close_button_visible = {
          fg = "black",
        },
        close_button_selected = {
          fg = "black",
        },
        buffer_visible = {
          fg = "black",
          bg = "white",
        },
        buffer_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        numbers = {
          fg = "#9e9e9e",
          bg = "white",
        },
        numbers_visible = {
          fg = "black",
          bg = "white",
        },
        numbers_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          italic = true,
        },
        diagnostic = {
          fg = "#9e9e9e",
          bg = "white",
        },
        diagnostic_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        diagnostic_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        hint = {
          fg = "#9e9e9e",
          bg = "white",
        },
        hint_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        hint_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        hint_diagnostic = {
          fg = "#9e9e9e",
          bg = "white",
        },
        hint_diagnostic_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        hint_diagnostic_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        info = {
          fg = "#9e9e9e",
          bg = "white",
        },
        info_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        info_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        info_diagnostic = {
          fg = "#9e9e9e",
          bg = "white",
        },
        info_diagnostic_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        info_diagnostic_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        warning = {
          fg = "#9e9e9e", -- = la couleur des buffers filenames !
          bg = "white",
        },
        warning_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        warning_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        warning_diagnostic = {
          fg = "#9e9e9e",
          bg = "white",
        },
        warning_diagnostic_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        warning_diagnostic_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        error = {
          fg = "#9e9e9e",
          bg = "white",
        },
        error_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        error_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        error_diagnostic = {
          fg = "#9e9e9e",
          bg = "white",
        },
        error_diagnostic_visible = {
          fg = "#9e9e9e",
          bg = "white",
        },
        error_diagnostic_selected = {
          fg = "black",
          bg = "white",
          bold = true,
          underline = true,
        },
        modified = {
          fg = "#ff6188",
        },
        modified_visible = {
          fg = "#ff6188",
        },
        modified_selected = {
          fg = "#ff6188",
        },
        --        duplicate_selected = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          italic = true,
        --        },
        --        duplicate_visible = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          italic = true,
        --        },
        --        duplicate = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          italic = true,
        --        },
        --        separator_selected = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        separator_visible = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        separator = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        indicator_visible = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        indicator_selected = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        pick_selected = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          bold = true,
        --          italic = true,
        --        },
        --        pick_visible = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          bold = true,
        --          italic = true,
        --        },
        --        pick = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --          bold = true,
        --          italic = true,
        --        },
        --        offset_separator = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
        --        trunc_marker = {
        --          fg = "<colour-value-here>",
        --          bg = "<colour-value-here>",
        --        },
      },
    },
  },
}
