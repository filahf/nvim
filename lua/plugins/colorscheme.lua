return {
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
    "sam4llis/nvim-tundra",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
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
