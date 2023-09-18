return {
  "dmmulroy/tsc.nvim",
  dependencies = { "rcarriga/nvim-notify" },
  event = "VeryLazy",
  config = function()
    require("tsc").setup()
  end,
}
