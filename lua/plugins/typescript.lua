return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local filter = require("config.lsp.utils.filter").filter
      local filterReactDTS = require("config.lsp.utils.filterReactDTS").filterReactDTS

      require("typescript-tools").setup {
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            silent = true,
            border = "rounded",
          }),
          ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
          ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            { virtual_text = false }
          ),
          ["textDocument/definition"] = function(err, result, method, ...)
            if vim.tbl_islist(result) and #result > 1 then
              local filtered_result = filter(result, filterReactDTS)
              return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
            end

            vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
          end,
        },
        settings = {
          expose_as_code_action = "all",
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          },
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeCompletionsForModuleExports = true,
            quotePreference = "auto",
          },
        }
      }
    end,
  },
  {
    "laytan/tailwind-sorter.nvim",
    cmd = {
      "TailwindSort",
      "TailwindSortOnSaveToggle",
    },
    keys = {
      { "<Leader>cS", "<CMD>TailwindSortOnSaveToggle<CR>", desc = "toggle Tailwind CSS classes sort on save" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
  },

  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },

  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },

  { "artemave/workspace-diagnostics.nvim" },
  {
    "axelvc/template-string.nvim",
    event = "VeryLazy",
    config = function()
      require("template-string").setup({
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
        jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
        remove_template_string = true,                                                              -- remove backticks when there are no template string
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
  },
}
