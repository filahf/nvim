return {
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
          ["@constant.falsy"] = { fg = "#BF616A", bold = false },
          Macro = {
            fg = "#D08770",
            bold = true,
          },
          Visual = {
            bg = "#3A515D", -- Choose a color you like.,
            bold = false, -- Or false.,
          },
        },

        telescope = {
          -- Available styles: `classic`, `flat`.
          style = "classic",
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = true,
        },
      })
      vim.api.nvim_set_hl(0, "@constant.falsy", { fg = "#BF616A" })
      -- vim.api.nvim_set_hl(0, "@String", { fg = "#a3be8c" })
      -- vim.cmd("colorscheme nordic")
    end,
  },
  {
    "4e554c4c/darkman.nvim",
    config = function()
      require("darkman").setup({
        -- change_background = ,
        send_user_event = false,
        colorscheme = { dark = "nordic", light = "github_light_colorblind" }, -- can be { dark = "x", light = "y" }
      })
    end,
  },
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.g.zenbones_compat = true
      vim.cmd("colorscheme zenbones")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })
    end,
  },
}
