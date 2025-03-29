return {
  {
    'CopilotC-Nvim/CopilotChat.nvim', -- Plugin repository
    branch = 'main', -- Branch to use
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- Dependency for Copilot functionality
      { 'nvim-lua/plenary.nvim' }, -- Dependency for utility functions
    },
    build = 'make tiktoken', -- Build command, only for MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      show_help = true, -- Show help message as virtual lines when waiting for user input
      show_folds = true, -- Show folds for sections in chat
      highlight_selection = true, -- Highlight selection
      highlight_headers = true, -- Highlight headers in chat, disable if using markdown renderers
      auto_follow_cursor = true, -- Auto-follow cursor in chat
      auto_insert_mode = true, -- Automatically enter insert mode when opening window and on new prompt
      insert_at_end = true, -- Move cursor to end of buffer when inserting text

      window = {
        layout = 'float', -- Window layout type
        relative = 'editor', -- Window position relative to the editor
        width = 0.97, -- Window width as a fraction of the editor width
        height = 0.5, -- Window height as a fraction of the editor height
        row = 99, -- Row position for the window
      },
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.', -- Description for completion mapping
          insert = '<Tab>', -- Key mapping for completion in insert mode
        },
        close = {
          normal = 'q', -- Key mapping to close in normal mode
          insert = '<C-c>', -- Key mapping to close in insert mode
        },
        reset = {
          normal = '<C-l>', -- Key mapping to reset in normal mode
          insert = '<C-l>', -- Key mapping to reset in insert mode
        },
        submit_prompt = {
          normal = '<CR>', -- Key mapping to submit prompt in normal mode
          insert = '<C-s>', -- Key mapping to submit prompt in insert mode
        },
        accept_diff = {
          normal = '<C-y>', -- Key mapping to accept diff in normal mode
          insert = '<C-y>', -- Key mapping to accept diff in insert mode
        },
        yank_diff = {
          normal = 'gy', -- Key mapping to yank diff in normal mode
          register = '"', -- Register to use for yanking
        },
        show_diff = {
          normal = 'gd', -- Key mapping to show diff in normal mode
        },
        show_info = {
          normal = 'gp', -- Key mapping to show info in normal mode
        },
        show_context = {
          normal = 'gs', -- Key mapping to show context in normal mode
        },
      },
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
