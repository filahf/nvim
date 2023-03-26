return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = function()
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
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
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
          follow_current_file = true,
          hijack_netrw_behavior = "open_default",
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              require("neo-tree").close_all()
            end,
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              untracked = "",
              ignored = "",
              unstaged = "",
              staged = "",
              conflict = "",
            },
          },
        },
      })
    end,
  },
}
