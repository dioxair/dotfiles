-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- These  NOTE: highlights
  { "numToStr/Comment.nvim", opts = {} },

  -- Import all kickstart plugins
  { import = "kickstart.plugins" },
  -- Import all custom plugins
  { import = "custom.plugins" },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {},
  },
})

-- vim: ts=2 sts=2 sw=2 et
