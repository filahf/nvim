return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local hl1 = "String"
    local hl2 = "Label"

    local default = {
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    }

    local header = {
      type = "text",
      val = default,
      opts = {
        position = "center",
        type = "ascii",
        hl = hl1,
      },
    }

    local quick_link_btns = {
      type = "group",
      val = {
        dashboard.button("r", " " .. " recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("F", " " .. " find and replace", ":lua require('spectre').open()<CR>"),
        dashboard.button("n", " " .. " notes", ":e ~/Documents/notes.md <CR>"),
      },
      opts = {
        hl = hl2,
        position = "center",
      },
    }

    local function config_section()
      return {
        type = "group",
        val = {
          { type = "text", val = "config", opts = { hl = hl1, position = "center" } },
          dashboard.button("c 1", "  nvim", ":cd ~/.config/nvim/<CR> :e init.lua<CR>"),
          dashboard.button("c 2", "  sway", ":cd ~/.config/sway/<CR> :e config<CR>"),
          dashboard.button("c 3", "  waybar", ":cd ~/.config/waybar/<CR> :e config.jsonc<CR>"),
          dashboard.button("c 4", "  foot", ":cd ~/.config/foot/<CR> :e foot.ini<CR>"),
        },
        opts = {
          position = "center",
          hl = hl2,
        },
      }
    end

    local misc_btns = {
      type = "group",
      val = {
        dashboard.button("q", "  quit", ":qa<CR>"),
      },
      opts = {
        position = "center",
      },
    }

    local config = {
      layout = {
        { type = "padding", val = 5 },
        header,
        { type = "padding", val = 2 },
        quick_link_btns,
        { type = "padding", val = 1 },
        misc_btns,
        { type = "padding", val = 1 },
        config_section(),
      },
      opts = {
        noautocmd = true,
        redraw_on_resize = true,
      },
    }

    alpha.setup(config)
  end,
}
