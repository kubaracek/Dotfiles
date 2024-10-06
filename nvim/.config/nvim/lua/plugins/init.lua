-- must be before lazy setup
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache"

-- must be after lazy setup
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  "nvim-lua/plenary.nvim",
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  { -- null-ls is for formatting
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      -- require("core.utils").load_mappings("dap")
    end
  },

  { -- Something for golang debugger
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies =  "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- require("core.utils").load_mappings("dap_go")
    end
  },

  { -- What if err != nil { return err } is added automatically :brainexplosion:
    -- TODO add :GoTagAdd json (or yaml)
    -- and GoTestAll (generates boilerplate)
    -- and GoIfErr (generates if err != nil ...)
    -- as Mappings
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css"
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- any options
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
