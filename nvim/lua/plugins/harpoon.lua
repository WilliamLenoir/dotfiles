return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>a",
        function()
          local mark = require("harpoon.mark")
          mark.add_file()
        end,
        desc = "Harpoon add file",
      },
      {
        "<leader>h",
        function()
          local ui = require("harpoon.ui")
          ui.toggle_quick_menu()
        end,
        desc = "Harpoon Menu",
      },
      {
        "<leader>A",
        function()
          local ui = require("harpoon.ui")
          ui.nav_file(1)
        end,
        desc = "Harpoon File 1",
      },
      {
        "<leader>Z",
        function()
          local ui = require("harpoon.ui")
          ui.nav_file(2)
        end,
        desc = "Harpoon File 2",
      },
      {
        "<leader>Q",
        function()
          local ui = require("harpoon.ui")
          ui.nav_file(3)
        end,
        desc = "Harpoon File 3",
      },
      {
        "<leader>S",
        function()
          local ui = require("harpoon.ui")
          ui.nav_file(4)
        end,
        desc = "Harpoon File 4",
      },
    },
  },
}
