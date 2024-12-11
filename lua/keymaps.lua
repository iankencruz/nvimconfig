--x[[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- general KEYMAPS
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<leader>w', '<cmd>:w<cr>', { desc = 'Save file' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Close all windows and exit from Neovim with <leader> and q
-- vim.keymap.set('n', '<leader>qq', ':qa!<CR>', { desc = 'Close all buffers' })

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>!e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>!q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

-- window management
vim.keymap.set('n', '<leader>sv', ':vsplit | lua vim.lsp.buf.definition()<CR>', { desc = 'Split Window [V]ertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sb', '<C-w>s', { desc = 'Split Window [B]elow' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Adjust Window Size [E]venly' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close Current Split Window' }) -- close current split window

-- Resize splits
vim.keymap.set('n', '<leader>k', '<cmd>resize +2<cr>', { desc = 'Resize Horizontal Split Up' })
vim.keymap.set('n', '<leader>j', '<cmd>resize -2<cr>', { desc = 'Resize Horizontal Split Down' })
vim.keymap.set('n', '<leader>h', '<cmd>vertical resize +2<cr>', { desc = 'Resize Vertical Split Right' })
vim.keymap.set('n', '<leader>l', '<cmd>vertical resize -2<cr>', { desc = 'Resize Vertical Split Left' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tailwind Tools
-- vim.keymap.set('n', '<leader>Fc', ':TailwindConcealToggle<CR>', { desc = 'toggles conceal.' })
-- vim.keymap.set('n', '<leader>Fa', ':TailwindSort<CR>', { desc = 'sorts all classes in the current buffer.' })
-- vim.keymap.set('n', '<leader>Fs', ':TailwindSortSelection<CR>', { desc = 'sorts selected classes in visual mode.' })

-- Copilot keymaps
vim.keymap.set('n', '<leader>pO', ':CopilotChatOpen<CR>', { desc = 'Open Copilot chat window' })
vim.keymap.set('n', '<leader>px', ':CopilotChatClose<CR>', { desc = 'Close Copilot chat window' })
vim.keymap.set('n', '<leader>pc', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot chat window' })
vim.keymap.set('n', '<leader>pS', ':CopilotChatStop<CR>', { desc = 'Stop Copilot chat window' })
vim.keymap.set('n', '<leader>pR', ':CopilotChatReset<CR>', { desc = 'Reset Copilot chat window' })
-- Copilot Prompts
vim.keymap.set('n', '<leader>p?', ':CopilotChatExplain<CR>', { desc = 'Write an explanation for the active selection as paragraphs of text' })
vim.keymap.set('n', '<leader>pr', ':CopilotChatReview<CR>', { desc = 'Review the selected code' })
vim.keymap.set('n', '<leader>pf', ':CopilotChatFix<CR>', { desc = 'There is a problem in this code. Rewrite the code to show it with the bug fixed' })
vim.keymap.set('n', '<leader>po', ':CopilotChatOptimize<CR>', { desc = 'Optimize the selected code to improve performance and readability' })
vim.keymap.set('n', '<leader>pd', ':CopilotChatDocs<CR>', { desc = 'Please add documentation comment for the selection' })
vim.keymap.set('n', '<leader>pt', ':CopilotChatTests<CR>', { desc = 'Please generate tests for my code' })
vim.keymap.set('n', '<leader>pq', ':CopilotChatFixDiagnostics<CR>', { desc = 'Please assist with the following diagnostic issue in file' })
-- Copilot Git Prompts
vim.keymap.set('n', '<leader>pgc', ':CopilotChatCommit<CR>', { desc = 'Write commit message for the change with commitizen convention' })
vim.keymap.set('n', '<leader>pgs', ':CopilotChatCommitStaged<CR>', { desc = 'Write commit message for the change with commitizen convention' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
