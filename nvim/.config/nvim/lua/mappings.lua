require "nvchad.mappings"

-- TODO kuba. Try to figure if this M table is necessary.
-- maybe I can use just the map fn for this?
local M = {}

M.Dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add Breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sydebar with all information"
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go-to Test",
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug run last",
    },
  },
}

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- Show lsp doc for whatever under cursor
map("n", "K", "<cmd>Lspsaga hover_doc<cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
return M
