return {
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "pylint" },
      }

      -- vim.keymap.set("n", "<leader>l", function()
      --   lint.try_lint()
      -- end, { desc = "lint file" })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        format_on_save = function(bufnr)
          -- Disable autoformat on certain filetypes
          local ignore_filetypes = { "sql", "java" }
          if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
          end
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          -- Disable autoformat for files in a certain path
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("/node_modules/") then
            return
          end
          -- ...additional logic...
          return { timeout_ms = 500, lsp_format = "fallback" }
        end,
        formatters_by_ft = {
          css = { "prettied", "prettier", stop_at_first = true },
          graphql = { "prettied", "prettier", stop_at_first = true },
          html = { "prettied", "prettier", stop_at_first = true },
          javascript = { "prettied", "prettier", stop_at_first = true },
          javascriptreact = { "prettied", "prettier", stop_at_first = true },
          json = { "prettied", "prettier", stop_at_first = true },
          lua = { "stylua" },
          markdown = { "prettied", "prettier", stop_at_first = true },
          python = { "isort", "black" },
          sql = { "sql-formatter" },
          svelte = { "prettied", "prettier", stop_at_first = true },
          typescript = { "prettied", "prettier", "sql-formatter", stop_at_first = true },
          typescriptreact = { "prettied", "prettier", stop_at_first = true },
          yaml = { "prettier" },
        },
      })
    end,
  },
}
