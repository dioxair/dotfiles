return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          color_icons = true,

          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " 󰅚 " or (e == "warning" and " 󰀪 " or " 󰌶 ")
              s = s .. n .. sym
            end
            return s
          end,
        },
        highlights = {
          fill = {
            fg = "#181818",
            bg = "#181818",
          },
          background = {
            fg = "#92969c",
            bg = "#181818",
          },
          tab = {
            fg = "#181818",
            bg = "#181818",
          },
          tab_selected = {
            fg = "#181818",
            bg = "#181818",
          },
          tab_separator = {
            fg = "#181818",
            bg = "#181818",
          },
          tab_separator_selected = {
            fg = "#181818",
            bg = "#181818",
            sp = "#181818",
          },
          close_button = {
            fg = "#181818",
            bg = "#181818",
          },
          pick_selected = {
            fg = "#FFFFFF",
            bg = "#181818",
            bold = true,
            italic = true,
          },
          pick_visible = {
            fg = "#FFFFFF",
            bg = "#181818",
            bold = true,
            italic = true,
          },
          pick = {
            fg = "#FFFFFF",
            bg = "#181818",
            bold = true,
            italic = true,
          },
        },
      })
    end,
  },
}
