#Magit for neovim?
---@type NvPluginSpec
return {
  "tpope/vim-fugitive",
  lazy = false,
  init = function()
    local map = vim.keymap.set
    map("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git Fugitive open" })
  end,
}

