return {
  'folke/trouble.nvim',
  opts = {
    auto_close = true,
    auto_jump = true,
    auto_preview = true,
    focus = true,
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>qq',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>qQ',
      '<cmd>Trouble diagnostics toggle  filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>qs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    -- {
    --   '<leader>ql',
    --   '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    --   desc = 'LSP Definitions / references / ... (Trouble)',
    -- },
    -- {
    --   '<leader>qL',
    --   '<cmd>Trouble loclist toggle<cr>',
    --   desc = 'Location List (Trouble)',
    -- },
    -- {
    --   '<leader>qF',
    --   '<cmd>Trouble qflist toggle<cr>',
    --   desc = 'Quickfix List (Trouble)',
    -- },
  },
}
