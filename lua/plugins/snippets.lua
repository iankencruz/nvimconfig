return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    local ok, ls = pcall(require, "luasnip")
    if not ok then return end

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local fmt = require("luasnip.extras.fmt").fmt
    local types = require "luasnip.util.types"

    -- options
    ls.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      store_selection_keys = "<c-s>",
      ext_opts = {
        [types.insertNode] = {
          -- visited = { hl_group = "Comment" },
          -- unvisited = { hl_group = "Comment" },
        },
        [types.choiceNode] = {
          active = {
            virt_text = { { "●", "InsertMode" } },
          },
        },
      },
    }

    local snips = {
      go = {
        s(
          { trig = "err", name = "error check" },
          fmt(
            [[
              if {} != nil {{
                {}
                return 
              }}
            ]],
            { i(1, "err"), i(2, "body") }
          )
        ),
        s(
          { trig = "main", name = "New Main Function Boilerplate" },
          fmt(
            [[
              package {}

              func {}() {{
                {}
              }}
            ]],
            { i(1, "main"), i(2, "main"), i(3, "body") }
          )
        ),
      },
    }

    -- add snips to engine
    ls.add_snippets(nil, {
      go = snips.go,
    })

    local list_snips = function()
      local ft_list = require("luasnip").available()[vim.o.filetype]
      local ft_snips = {}
      for _, item in pairs(ft_list) do
        ft_snips[item.trigger] = item.name
      end
      P(ft_snips)
    end

    vim.api.nvim_create_user_command("SnipList", list_snips, {})
  end,
}
