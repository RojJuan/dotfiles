local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
})
