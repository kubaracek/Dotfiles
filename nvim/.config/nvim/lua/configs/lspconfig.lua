-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


local lspconfig = require "lspconfig"
local util = lspconfig.util

local servers = { "html", "cssls", "gopls", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Disable the virtual text varnings that are displayed by default.
-- I use tiny-inline-diagnstics plugin that takes care of that
vim.diagnostic.config({virtual_text=false})

-- Mappings to override LSP
local ooo = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  vim.keymap.set("n", "gD", "<cmd> Telescope lsp_type_definitions<cr>", { buffer = bufnr })
  vim.keymap.set("n", "gd", "<cmd> Telescope lsp_definitions<cr>", { buffer = bufnr })
  vim.keymap.set("n", "gr", "<cmd> Telescope lsp_references<cr>", { buffer = bufnr })
  vim.keymap.set("n", "gi", "<cmd> Telescope lsp_implementations<cr>", { buffer = bufnr })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = ooo,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    }
  },
}

lspconfig.ts_ls.setup {
  on_attach = ooo,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
