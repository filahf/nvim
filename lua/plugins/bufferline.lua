return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        indicator = {
          style = "none",
        },
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            padding = 1,
          },
        },
        separator_style = "thin",
      },
    })
  end,
}
