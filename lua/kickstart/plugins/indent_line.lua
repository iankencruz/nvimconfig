return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        highlight = {
          'CursorColumn',
          'Whitespace',
        },
      },
    },
    config = function(_, opts)
      -- paste the hooks code here
      -- change the setup() call to:
      require('ibl').setup {
        indent = { highlight = opts.indent.highlight, char = '' },
        whitespace = {
          highlight = opts.indent.highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
    end,
  },
}
