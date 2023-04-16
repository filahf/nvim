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
        -- transparent_bg = true,
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
  -- {
  --   "mcchrish/zenbones.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = { "rktjmp/lush.nvim", lazy = true },
  --   config = function()
  --     local opts = { lightness = "bright", darkness = "warm", solid_line_nr = true }
  --     vim.g.zenbones = opts
  --     vim.o.background = "light"
  --     vim.o.termguicolors = true
  --     vim.cmd("colorscheme zenbones")
  --     local lush = require("lush")
  --     local base = require("zenbones")
  --     -- = '#1C1917'
  --     local red = "#DE6E7C"
  --     local green = "#819B69"
  --     -- = '#B77E64'
  --     local blue = "#6099C0"
  --     -- = '#B279A7'
  --     -- = '#66A5AD'
  --     -- = '#B4BDC3'
  --     -- = '#403833'
  --     -- = '#E8838F'
  --     --  = '#8BAE68'
  --     -- local orange = "#D68C67"
  --     --  = '#61ABDA'
  --     --  = '#CF86C1'
  --     --  = '#65B8C1'
  --     --  = '#888F94'
  --     -- Create some specs
  --     local specs = lush.parse(function(injected_functions)
  --       local sym = injected_functions.sym
  --       return {
  --         sym("@string")({ base.String, fg = green, gui = "italic" }),
  --         -- sym("@type")({ base.Type, fg = orange, gui = "" }),
  --         sym("@method.call")({ base.String, fg = blue, gui = "italic,bold" }),
  --         sym("@constant.falsy")({ base.String, fg = red, gui = "bold" }),
  --         -- sym("@function.call")({ base.String, fg = red, gui = "bold" }),
  --       }
  --     end)
  --
  --     -- Apply specs using lush tool-chain
  --     lush.apply(lush.compile(specs))
  --   end,
  -- },
}
