return {
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local custom_codedark = require("lualine.themes.codedark")

      custom_codedark.normal.c.bg = "#0f0f0f"
      custom_codedark.insert.c.bg = "#0f0f0f"
      custom_codedark.inactive.b.bg = "#0f0f0f"
      custom_codedark.visual.b.bg = "#0f0f0f"
      custom_codedark.replace.c.bg = "#0f0f0f"

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = custom_codedark,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}
