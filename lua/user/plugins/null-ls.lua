return {
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  event = "VeryLazy",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      debug = false,
      sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.prettierd.with({
          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
          },
        }),
      },
    })
  end,
}
