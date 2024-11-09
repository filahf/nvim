return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent = true,
        bold_keywords = true,
        on_hightlight = {
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
  -- {
  --   "4e554c4c/darkman.nvim",
  --   config = function()
  --     require("darkman").setup({
  --       -- change_background = true,
  --       send_user_event = false,
  --       colorscheme = { dark = "tundra", light = "github_light_default" }, -- can be { dark = "x", light = "y" }
  --     })
  --   end,
  -- },
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.g.zenbones_compat = true
    end,
  },
  {
    "sam4llis/nvim-tundra",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("nvim-tundra").setup({
        transparent_background = false,
        dim_inactive_windows = {
          enabled = false,
          color = nil,
        },
        sidebars = {
          enabled = true,
          color = nil,
        },
        editor = {
          search = {},
          substitute = {},
        },
        syntax = {
          booleans = { bold = true, italic = true },
          comments = { bold = true, italic = true },
          conditionals = {},
          constants = { bold = true },
          fields = {},
          functions = {},
          keywords = {},
          loops = {},
          numbers = { bold = true },
          operators = { bold = true },
          punctuation = {},
          strings = {},
          types = { bold = true, italic = true },
        },
        diagnostics = {
          errors = {},
          warnings = {},
          information = {},
          hints = {},
        },
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
          textfsm = true,
        },
        overwrite = {
          colors = {},
          highlights = {
            GitSignsCurrentLineBlame = { fg = "#BF616A", bold = false },
            ["@include"] = { fg = "#9D7495", bold = false },
            ["@keyword.import"] = { fg = "#9D7495", bold = false },
            ["@keyword.export"] = { fg = "#9D7495", bold = true },
            ["@constant.falsy"] = { fg = "#BF616A", bold = false },
          },
        },
      })

      vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
      vim.opt.background = "dark"
      vim.cmd("colorscheme tundra")
    end,
  },
}
