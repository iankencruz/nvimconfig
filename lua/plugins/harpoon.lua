return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    require("telescope").load_extension "harpoon"

    keymap.set(
      "n",
      "<leader>hx",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon malk" })
    keymap.set(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>hm",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )

    keymap.set(
      "n",
      "<leader>1",
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )
    keymap.set(
      "n",
      "<leader>2",
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )

    keymap.set(
      "n",
      "<leader>3",
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )
    keymap.set(
      "n",
      "<leader>4",
      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )

    keymap.set(
      "n",
      "<leader>5",
      "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
      { desc = "Toggle Harpoon Quick Menu" }
    )

    keymap.set("n", "<leader>t1", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>")
  end,
  -- saves the harpoon file upon every change. Disabling is unrecommended
  save_on_change = true,
  excluded_filetypes = { "harpoon" },
  save_on_toggle = false,
}
