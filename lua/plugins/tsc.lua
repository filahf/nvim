return {
  {
    "dmmulroy/tsc.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    event = "VeryLazy",
    config = function()
      require("tsc").setup()
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "VeryLazy",
    config = function()
      require("ts-error-translator").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup({
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeCompletionsForModuleExports = true,
            quotePreference = "auto",
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
          tsserver_plugins = {
            -- for TypeScript v4.9+
            "@styled/typescript-styled-plugin",
            -- or for older TypeScript versions
            -- "typescript-styled-plugin",
          },
        },
      })
    end,
  },
  {
    "axelvc/template-string.nvim",
    event = "VeryLazy",
    config = function()
      require("template-string").setup({
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
        jsx_brackets = true, -- must add brackets to jsx attributes
        remove_template_string = true, -- remove backticks when there are no template string
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
  },
}
