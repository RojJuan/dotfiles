return {
  -- 1. Manage LSP configurations
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig" -- Loads our custom LSP configs
    end,
  },

  -- 2. Automatically install tools via Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",  -- Python LSP
        "black",    -- Python Formatter
        "ruff"
      },
    },
  },

  -- 3. Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "python"
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  -- 5. Python Debugger (DAP)
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- Path to python executable with debugpy installed
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      -- Assign Ruff to Python files
      lint.linters_by_ft = {
        python = { "ruff" },
      }

      -- Create an autocmd to trigger linting automatically
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { 
      auto_trigger = true,
      keymap = {
        accept = "<C-a>",
        },
      },
    })
  end,
  },
}

