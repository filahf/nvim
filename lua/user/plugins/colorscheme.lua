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
      -- vim.api.nvim_set_hl(0, "@String", { fg = "#a3be8c" })
      -- vim.cmd("colorscheme nordic")
    end,
  },
  {
    "4e554c4c/darkman.nvim",
    config = function()
      require("darkman").setup({
        change_background = true,
        send_user_event = false,
        colorscheme = { dark = "nordic", light = "zenbones" }, -- can be { dark = "x", light = "y" }
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
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        dim_inactive = true,
        color_set = "mellifluous",
        styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
          comments = { italic = true },
          conditionals = {},
          folds = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          markup = {
            headings = { bold = true },
          },
        },
        transparent_background = {
          enabled = true,
          floating_windows = true,
          telescope = true,
          file_tree = true,
          cursor_line = true,
          status_line = false,
        },
        flat_background = {
          line_numbers = false,
          floating_windows = false,
          file_tree = false,
          cursor_line_number = false,
        },
        plugins = {
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          nvim_tree = {
            enabled = true,
            show_root = true,
          },
          neo_tree = {
            enabled = true,
          },
          telescope = {
            enabled = true,
            nvchad_like = true,
          },
          startify = true,
        },
      })
      -- vim.cmd("colorscheme mellifluous")
    end,
  },
}
