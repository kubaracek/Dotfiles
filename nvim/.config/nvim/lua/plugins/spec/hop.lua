-- EasyMotion essentially
---@type NvPluginSpec
return {
  "smoka7/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
  init = function()
    local map = vim.keymap.set
    map("n", "<leader><leader>", "<cmd>HopWord<CR>", { desc = "Hint all words" })
  end,
  opts = { keys = "etovxqpdygfblzhckisuran" },
  config = function(_, opts)
    require("hop").setup(opts)
  end,
}
