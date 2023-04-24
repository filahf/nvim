return {
  {
    "johmsalas/text-case.nvim",
    event = "VeryLazy",
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
  },
}
