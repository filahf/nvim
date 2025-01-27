return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local wk = require("which-key")

    local mappings = {
      { "<leader>w",  "<cmd>w!<CR>",                        desc = "Save",                nowait = true, remap = false },
      { "<leader>W",  "<cmd>noa w!<CR>",                    desc = "Save without format", nowait = true, remap = false },
      { "<leader>a",  "<cmd>Alpha<cr>",                     desc = "Alpha",               nowait = true, remap = false },
      { "<leader>b",  group = "Buffers",                    nowait = true,                remap = false },
      { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by Extension",   nowait = true, remap = false },
      { "<leader>bl", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by Directory",   nowait = true, remap = false },
      {
        "<leader>bx",
        "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>",
        desc = "Close other buffers",
        nowait = true,
        remap = false,
      },
      { "<leader>e",  desc = "Explorer",                        nowait = true,        remap = false },
      { "<leader>g",  group = "Git",                            nowait = true,        remap = false },
      { "<leader>l",  group = "LSP",                            nowait = true,        remap = false },
      { "<leader>lA", "<cmd>TSToolsFixAll<cr>",                 desc = "Fix All",     nowait = true, remap = false },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
      {
        "<leader>ld",
        "<cmd>TSToolsGoToSourceDefinition<cr>",
        desc = "Go to TS definition",
        nowait = true,
        remap = false,
      },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format",           nowait = true, remap = false },
      {
        "<leader>li",
        "<cmd>TSToolsAddMissingImports<cr>",
        desc = "Import missing imports",
        nowait = true,
        remap = false,
      },
      { "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>",   desc = "Organize Imports", nowait = true, remap = false },
      { "<leader>q",  "<cmd>q!<CR>",                       desc = "Quit",             nowait = true, remap = false },
      { "<leader>r",  group = "Rename",                    nowait = true,             remap = false },
      { "<leader>rR", "<cmd>TSToolsRenameFile<cr>",        desc = "Rename TS file",   nowait = true, remap = false },
      {
        "<leader>d",
        "<cmd>FzfLua lsp_document_symbols<cr>",
        desc = "Document Symbols",
        nowait = true,
        remap = false,
      },
      { "<leader>x", group = "Trouble", nowait = true, remap = false },
    }

    -- wk.setup(setup)
    wk.add(mappings)
  end,
}
