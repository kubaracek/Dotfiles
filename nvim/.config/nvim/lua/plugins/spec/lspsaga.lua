-- LSP nice to have things
---@type NvPluginSpec
return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require('lspsaga').setup({
      symbols_in_winbar = {
        enable = true,
      },
      implement = {
        enable = true,
        sign = true,
        virtual_text = true,
      },
      lightbulb = {
        virtual_text = false,
      },
    })
  end,
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }
}
