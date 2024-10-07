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

-- o.cursorlineopt ='both' -- to enable cursorline!
--
--
