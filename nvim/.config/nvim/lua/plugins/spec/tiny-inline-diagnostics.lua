-- Shows errors in code on highlight
---@type NvPluginSpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  config = function()
    require("tiny-inline-diagnostic").setup()
  end,
}
