return {
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      -- vim.opt.background = "dark"
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
      })
      -- vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
        bold_keywords = true,
        override = {
          ["@include"] = { fg = "#9D7495", bold = false },
          ["@keyword.import"] = { fg = "#9D7495", bold = false },
          ["@keyword.export"] = { fg = "#9D7495", bold = false },
          Macro = {
            fg = "#D08770",
            bold = true,
          },
          Visual = {
            bg = "#3A515D", -- Choose a color you like.,
            bold = false, -- Or false.,
          },
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = true,
        },
      })
      vim.api.nvim_set_hl(0, "@constant.falsy", { fg = "#BF616A" })
      vim.cmd("colorscheme nordic")
    end,
  },
}
