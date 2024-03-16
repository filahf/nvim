return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local wk = require("which-key")
    local setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = " ", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
      a = { "<cmd>Alpha<cr>", "Alpha" },
      b = {
        name = "Buffers",
        e = { "<cmd>BufferLineSortByExtension<cr>", "Sort by Extension" },
        l = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by Directory" },
        s = {
          "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
          "Search buffer",
        },
        x = { "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>", "Close other buffers" },
      },
      e = { "<cmd>Neotree toggle<cr>", "Explorer" },
      g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      },
      h = { "<cmd>nohlsearch<CR>", "No Highlight" },
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        A = { "<cmd>TSToolsFixAll<cr>", "Fix All" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        d = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Go to TS definition" },
        i = { "<cmd>TSToolsAddMissingImports<cr>", "Import missing imports" },
        o = { "<cmd>TSToolsOrganizeImports<cr>", "Organize Imports" },
        r = { "<cmd>Telescope lsp_references<cr>", "References" },
      },
      m = {
        name = "Minimap",
        m = { "<cmd>lua MiniMap.toggle()<cr>", "Minimap toggle" },
        r = { "<cmd>lua MiniMap.refresh()<cr>", "Minimap refresh" },
      },
      q = { "<cmd>q!<CR>", "Quit" },
      r = {
        name = "Rename",
        R = { "<cmd>TSToolsRenameFile<cr>", "Rename TS file" },
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      },
      w = { "<cmd>w!<CR>", "Save" },
      W = { "<cmd>noa w!<CR>", "Save without format" },
    }

    wk.setup(setup)
    wk.register(mappings, opts)
  end,
}
