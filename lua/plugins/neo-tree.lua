return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
    cmd = "Neotree",
    config = function()
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          mappings = {
            ["l"] = "open",
            ["<c-x>"] = "open_split",
            ["<c-v>"] = "open_vsplit",
            ["h"] = "close_node",
            ["H"] = "navigate_up",
            ["."] = "toggle_hidden",
            ["<C-c>"] = "close_window",
            ["<CR>"] = "open_with_window_picker",
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              ".DS_Store",
              "thumbs.db",
              --"node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
          hijack_netrw_behavior = "open_default",
          follow_current_file = {
            enabled = true,          -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,          -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
        },
        event_handlers = {
          -- {
          --   event = "file_opened",
          --   ---@diagnostic disable-next-line: unused-local
          --   handler = function(file_path)
          --     require("neo-tree").close_all()
          --   end,
          -- },
        },
        default_component_configs = {
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            use_git_status_colors = false,
          },
          git_status = {
            symbols = {
              added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted = "✖", -- this can only be used in the git_status source
              renamed = "", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },
      })
    end,
  },
}
