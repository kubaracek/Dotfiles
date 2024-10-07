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
      outline = {
        close_after_jump = true,
        keys = { jump = "<CR>" },
      },
    })

    -- lsp keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      end,
    })


  end,
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }
}
