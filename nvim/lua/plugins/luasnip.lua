return {
  --go to last visited buffer
  {
    "L3MON4D3/LuaSnip",
    lazy = false, --INFO: INPORTANT if we want to have the snippets with <c-j> on startup
    config = function()
      local ls = require("luasnip")
      -- some shorthands...
      local snip = ls.snippet
      local text = ls.text_node
      local insert = ls.insert_node
      local func = ls.function_node

      local date = function()
        return { os.date("%Y-%m-%d") }
      end

      ls.add_snippets(nil, {
        all = {
          snip({
            trig = "timestamp",
            namr = "timestamp",
            dscr = "Date in the form of YYYY-MM-DD",
          }, {
            func(date, {}),
          }),

          snip({
            trig = "log",
            namr = "console.log()",
            dscr = "js console.log()",
          }, {
            text({ "console.log(" }),
            insert(1, "to_log"),
            text({ ")" }),
          }),

          snip({
            trig = "plug",
            namr = "plug install",
            dscr = "add a vim module with plug",
          }, {
            text({ "Plug '" }),
            insert(1, "git repo"),
            text({ "'" }),
          }),

          snip({
            trig = "cb",
            namr = "block of code",
            dscr = "block of code",
          }, {
            text({ "```" }),
            insert(1, "languange_name"),
            text({ "", "" }),
            insert(2, "code"),
            text({ "", "```" }),
          }),

          snip({
            trig = "new page markdown wiki",
            namr = "new markdown page",
            dscr = "new markdown page",
          }, {
            text({ "[[TOC]]", "", "# " }),
            insert(1, "Main_Title"),
            text({ "", "", "📌 tags: #-" }),
            insert(2, "keyword"),
            text({ "", "", "## " }),
            insert(3, "Concepts"),
            text({ "", "", "## Resources", "" }),
          }),

          snip({
            trig = "lorem",
            namr = "lorem",
            dscr = "lorem",
          }, {
            text({
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In in quam et tortor dapibus malesuada eu ac lorem. Curabitur eros diam, vestibulum id ante sit amet, imperdiet fermentum massa. Curabitur fringilla mauris sapien, nec ultrices ante ultricies id. Nunc eu nulla vitae mi luctus tempus. Morbi consequat dolor turpis. Phasellus semper egestas magna, quis posuere ipsum lobortis et. Aenean eget sagittis mi. Donec eros ligula, finibus eget felis vitae, imperdiet dignissim sem. Praesent fermentum eleifend ipsum ac lacinia. Cras ultrices diam leo, sed vulputate purus cursus aliquet.",
            }),
          }),

          snip({
            trig = "to_fix",
            namr = "TO_FIX",
            dscr = "TO_FIX",
          }, {
            text({ "TO_FIX:" }),
          }),

          snip({
            trig = "to_implement",
            namr = "TO_IMPLEMENT",
            dscr = "TO_IMPLEMENT",
          }, {
            text({ "TO_IMPLEMENT:" }),
          }),

          snip({
            trig = "custom_change",
            namr = "CUSTOM_CHANGE",
            dscr = "CUSTOM_CHANGE",
          }, {
            text({ "CUSTOM_CHANGE:" }),
          }),

          snip({
            trig = "date",
            namr = "date",
            dscr = "date",
          }, {
            text({ "DATE:" }),
          }),

          snip({
            trig = "today",
            namr = "today",
            dscr = "Date in the form of YYYY-MM-DD",
          }, {
            func(function()
              return {
                "DATE: " .. os.date("%Y-%m-%d-%Hh%M"),
              }
            end, {}),
          }),

          snip({
            trig = "question",
            namr = "question",
            dscr = "question",
          }, {
            text({ "question:" }),
          }),

          snip({
            trig = "reponse",
            namr = "reponse",
            dscr = "reponse",
          }, {
            text({ "reponse:" }),
          }),

          snip({
            trig = "tags",
            namr = "tags",
            dscr = "markdown tags",
          }, {
            text({ "📌 tags: #-" }),
            insert(1, "keyword"),
          }),

          snip({
            trig = "uml classe plantuml",
            namr = "uml classe plantuml",
            dscr = "uml classe plantuml",
          }, {
            text({
              " ```plantuml",
              "@startuml",
              "object Pipeline",
              "object Job",
              "object Stage",
              "",
              "Pipeline : name : string",
              "",
              'Pipeline o-- "*" Stage',
              'Stage o-- "*" Job',
              "@enduml",
              "```",
            }),
          }),

          snip({
            trig = "lua",
            namr = "lua",
            dscr = "lua",
          }, {
            text({ "lua << EOF", "" }),
            insert(1, "code"),
            text({ "", "EOF" }),
          }),

          snip({
            trig = "uml sequence plantuml",
            namr = "uml sequence plantuml",
            dscr = "uml sequence plantuml",
          }, {
            text({
              " ```plantuml",
              "@startuml",
              "Alice -> Bob: Authentication Request",
              "Bob --> Alice: Authentication Response",
              "",
              "Alice -> Bob: Another authentication Request",
              "Alice <-- Bob: Another authentication Response",
              "@enduml",
              "```",
            }),
          }),

          snip({
            trig = "checkbox",
            namr = "checkbox",
            dscr = "checkbox",
          }, {
            text({ "[ ] " }),
          }),

          snip({
            trig = "separator",
            namr = "separator",
            dscr = "separator",
          }, {
            text({
              "--------------------------------------------------------------------------------",
              "",
            }),
          }),

          snip({
            trig = "conventional-commit",
            namr = "conventional-commit",
            dscr = "conventional-commit",
          }, {
            text({ "feat: [PLATEU-] message" }),
          }),

          snip({
            trig = "evr",
            namr = "remerciements",
            dscr = "remerciements",
          }, {
            text({ "En vous remerciant par avance pour votre aide." }),
          }),

          snip({
            trig = "bc",
            namr = "bien-cordialement",
            dscr = "bien-cordialement",
          }, {
            text({ "Bien cordialement," }),
          }),

          snip({
            trig = "td",
            namr = "terraform debug",
            dscr = "terraform debug",
          }, {
            text({
              'resource "local_file" "debug1" {',
              '    content = tostring("")',
              '    filename = "debug1"',
              "}",
            }),
          }),

          snip({
            trig = "meta",
            namr = "Metadata",
            dscr = "Yaml metadata format for markdown",
          }, {
            text({ "---", "title: " }),
            insert(1, "note_title"),
            text({ "", "author: " }),
            insert(2, "author"),
            text({ "", "date: " }),
            func(date, {}),
            text({ "", "categories: [" }),
            insert(3, ""),
            text({ "]", "lastmod: " }),
            func(date, {}),
            text({ "", "tags: [" }),
            insert(4),
            text({ "]", "comments: true", "---", "" }),
            insert(0),
          }),
        },
      })
    end,
  },
}
