return {
  'tpope/vim-fugitive',

  keys = {
    {
      '<leader>gc',
      '<cmd>:Git commit<cr>',
      desc = 'Git [C]ommit',
    },
    {
      '<leader>gb',
      '<cmd>:Git blame<cr>',
      desc = 'Git [B]lame',
    },
    {
      '<leader>gs',
      '<cmd>:Git<cr>',
      desc = 'Git [S]tatus',
    },
    {
      '<leader>gd',
      '<cmd>:Gvdiffsplit<cr>',
      desc = 'Git [D]iff',
    },
    {
      '<leader>ga',
      '<cmd>:Gwrite<cr>',
      desc = 'Git [A]dd current file',
    },
    {
      '<leader>gr',
      '<cmd>:GRemove<cr>',
      desc = 'Git [R]emove',
    },
    {
      '<leader>gl',
      '<cmd>:Git log<cr>',
      desc = 'Git [L]og',
    },
    {
      '<leader>gm',
      '<cmd>:Git mergetool<cr>',
      desc = 'Git [M]erge',
    },
    {
      '<leader>gh',
      function()
        require('telescope').extensions.git_file_history.git_file_history()
      end,
      desc = 'Git [H]istory',
    },
    {
      '<leader>gaa',
      '<cmd>:Git add .<cr>',
      desc = 'Git [A]dd [A]ll',
    },
  },
}
