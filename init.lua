-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Configure LSP ]]
vim.filetype.add { extension = { templ = 'templ' } }

-- Show only the current line
vim.diagnostic.config { virtual_lines = { current_line = true } }

-- A little function to switch how to show diagnostics
local default_config = { virtual_lines = { current_line = true } }
vim.diagnostic.config(default_config)

vim.keymap.set('n', '<leader>k', function()
  -- virtual_lines is either a table or true/false, let's just check for the
  -- boolean value.
  if vim.diagnostic.config().virtual_lines == true then
    vim.diagnostic.config(default_config)
  else
    vim.diagnostic.config { virtual_lines = true }
  end
end, { desc = 'Toggle showing all diagnostics or just current line' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
