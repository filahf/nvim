return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
    local tree_cb = nvim_tree_config.nvim_tree_callback
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        exclude = { ".git", "node_modules", ".env*" },
      },
      live_filter = {
        always_show_folders = false,
      },
      view = {
        width = 30,
        side = "left",
        mappings = {
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
            { key = "h", cb = tree_cb("close_node") },
            { key = "v", cb = tree_cb("vsplit") },
          },
        },
      },
    })
  end,
}
