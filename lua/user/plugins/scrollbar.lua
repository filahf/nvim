local colors = require("catppuccin.palettes").get_palette("macchiato")
return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  config = function()
    require("scrollbar.handlers.search").setup({
      -- hlslens config overrides
    })
    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    })
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
