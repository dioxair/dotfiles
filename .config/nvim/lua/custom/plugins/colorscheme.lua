return {
  -- VS Code Colorscheme
  {
    "Mofiqul/vscode.nvim",
    priority = 1000, -- load plugin first before any others
    lazy = false,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
          Normal = { bg = "#181818" },
        },
      })
      require("vscode").load()
    end,
  },
}
