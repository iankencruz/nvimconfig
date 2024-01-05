return {
  "Mofiqul/dracula.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local dracula = require "dracula"

    dracula.setup {
      show_end_of_buffer = true,
      -- transparent background | default = false
      transparent_bg = true,
    }

    -- load the colorscheme here
    vim.cmd [[colorscheme dracula]]
  end,
}
