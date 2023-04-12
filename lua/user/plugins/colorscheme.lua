return {
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      -- vim.opt.background = "dark"
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
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
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
          illuminate = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
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
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = true,
        },
      })
      -- vim.cmd("colorscheme nordic")
    end,
  },
  {
    "mcchrish/zenbones.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.o.background = "light"
      vim.o.termguicolors = true
      vim.cmd("colorscheme zenbones")
      local lush = require("lush")
      local base = require("zenbones")
      local green = lush.hsluv(120, 64, 61)

      -- Create some specs
      local specs = lush.parse(function(injected_functions)
        local sym = injected_functions.sym
        return {
          sym("@string")({ base.String, fg = green, gui = "italic" }),
        }
      end)

      -- Apply specs using lush tool-chain
      lush.apply(lush.compile(specs))
    end,
  },
}
