local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("markdown", {
  s("table", {
    t({
      "| Column 1 | Column 2 | Column 3 |",
      "|----------|----------|----------|",
      "| Data 1   | Data 2   | Data 3   |",
      "| Data 4   | Data 5   | Data 6   |",
    }),
  }),
  s("dropdown", {
    t({ "<details>", "<summary>Here's a dropdown</summary>", "", "Dropdown text here", "</details>" }),
  }),
})
