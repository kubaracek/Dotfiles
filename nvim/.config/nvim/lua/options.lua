require "nvchad.options"

local opt = vim.opt
local o = vim.o

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- undo
opt.backup = false
opt.swapfile = false
o.undofile = true

-- scroll
opt.scrolloff = 10
opt.wrap = false
o.relativenumber = true

--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--   pattern = "NvimTree_*",
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--   end
-- })
--
-- vim.api.nvim_create_autocmd("QuitPre", {
--   callback = function()
--     local invalid_win = {}
--     local wins = vim.api.nvim_list_wins()
--     for _, w in ipairs(wins) do
--       local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
--       if bufname:match("NvimTree_") ~= nil then
--         table.insert(invalid_win, w)
--       end
--     end
--     if #invalid_win == #wins - 1 then
--       -- Should quit, so we close all invalid windows.
--       for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
--     end
--   end
-- })
