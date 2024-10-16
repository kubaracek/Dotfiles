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
        "bash",
        "fish",
        "comment",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "yaml",
        "regex",
        "scss",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        -- Go
        "go",
        "gomod",
        "gosum",
        "gowork",
        "printf",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
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

  { import = "plugins.spec.none-ls" },
  -- { import = "plugins.spec.neogit" },
  { import = "plugins.spec.vim-illuminate" },
  { import = "plugins.spec.lspsaga" },
  -- { import = "plugins.spec.dropbar" },
  { import = "plugins.spec.edgy" },
  { import = "plugins.spec.hop" },
  { import = "plugins.spec.markview" },
  { import = "plugins.spec.matchup" },
  { import = "plugins.spec.multicursor" },
  -- { import = "plugins.spec.outline" },
  { import = "plugins.spec.precognition" },
  { import = "plugins.spec.regexplainer" },
  { import = "plugins.spec.tiny-code-action" },
  { import = "plugins.spec.tiny-inline-diagnostics" },
  { import = "plugins.spec.todo-comments" },
  { import = "plugins.spec.treesitter-textobjects"},
  { import = "plugins.spec.trouble" },
  { import = "plugins.spec.ts-autotag" },
  { import = "plugins.spec.ts-context-commentstring" },
  { import = "plugins.spec.undo-tree" },
  { import = "plugins.spec.zen-mode" },
  { import = "plugins.spec.nvim-surround" },
  { import = "plugins.spec.faster-jk" },
  -- { import = "plugins.spec.better-escape" },
  { import = "plugins.spec.fugitive" },
}
