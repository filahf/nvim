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
