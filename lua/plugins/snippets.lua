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
      -- ============================
      -- go snippets
      go = {
        s(
          { trig = "err", name = "error check" },
          fmt(
            [[
              if <> != nil {
                return <>
              }
            ]],
            { i(1, "err"), i(2, "body") },
            { delimiters = "<>" }
          )
        ),
        s(
          { trig = "main", name = "New Main Function Boilerplate" },
          fmt(
            [[
              package <>

              func <>() {
                <>
              }
            ]],
            { i(1, "main"), i(2, "main"), i(3, "body") },
            { delimiters = "<>" }
          )
        ),
        s(
          { trig = "struct", name = "Create new Struct" },
          fmt(
            [[
              type <> struct {
                  <>
              }
            ]],
            { i(1, ""), i(2, ""), },
            { delimiters = "<>" }
          )
        ),
        s(
          { trig = "method", name = "Create new Struct method" },
          fmt(
            [[
              func (<> *<>) <>(<>) <> {
                  <>
              }
            ]],
            { i(1, "m"), i(2, "method"), i(3, "title"), i(4, ""), i(5, ""), i(6, "") },
            { delimiters = "<>" }
          )
        ),
      },
      -- ============================
      -- html snippets
      html = {
        s(
          { trig = "{*", name = "Go Template comment tag" },
          fmt(
            [[
            {{/* <> /*}}
            ]],
            {
              i(1),
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "define", name = "Go Template define tag" },
          fmt(
            [[
            {{define "<>"}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "if", name = "Go Template if tag" },
          fmt(
            [[
            {{if <>}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "ifelse", name = "Go Template if else tag" },
          fmt(
            [[
            {{if <>}}
              <>
            {{else}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2),
              i(3),
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "range", name = "Go Template range tag" },
          fmt(
            [[
            {{range <>}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "with", name = "Go Template with tag" },
          fmt(
            [[
            {{with <>}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "template", name = "Go Template template tag" },
          fmt(
            [[
            {{template "<>" <>}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
        s(
          { trig = "block", name = "Go Template block tag" },
          fmt(
            [[
            {{block <>}}
              <>
            {{end}}
            ]],
            {
              i(1),
              i(2)
            },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
          )
        ),
      },
    }

    -- add snips to engine
    ls.add_snippets(nil, {
      go = snips.go,
      html = snips.html,
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
