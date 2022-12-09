local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local hl1 = "String"
local hl2 = "Label"
local hl3 = "Type"

local christmas = {
	[[                  __/\__      ]],
	[[                  \ ** /       ]],
	[[                  /_**_\ ]],
	[[                  / \/ \ ]],
	[[                // ^  $ \\ ]],
	[[              /____________\ ]],
	[[             //  *  %    \\^ ]],
	[[           ^/ /  @   +  #  \ \ ]],
	[[          /__/______________\__\^ ]],
	[[         * /  /   +        \  \ * ]],
	[[        /%  /$    G O D *  \ # \ ]],
	[[      ^/____/____o___________\____\ ]],
	[[      * /  ^/            @  \    \ * ]],
	[[      / %  /  *   J U L      \   # \ ]],
	[[   o/^    /o          #   %   \o    ^\ ]],
	[[ /_____/_______________________\______\ ]],
	[[ *   o   *    o   | * |  o   *    o   * ]],
	[[                  |   | ]],
	[[                  |___| ]],
}

-- local default = {
-- 	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
-- 	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
-- 	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
-- 	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
-- 	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
-- 	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
-- }

local header = {
	type = "text",
	val = christmas,
	opts = {
		position = "center",
		type = "ascii",
		hl = hl1,
	},
}

local quick_link_btns = {
	type = "group",
	val = {
		dashboard.button("n", " " .. " new file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", " " .. " recent files", ":Telescope oldfiles <CR>"),
		dashboard.button(
			"p",
			" " .. " find project",
			":lua require('telescope').extensions.projects.projects()<CR>"
		),
		dashboard.button("f", " " .. " find file", ":Telescope find_files <CR>"),
		dashboard.button("t", " " .. " find text", ":Telescope live_grep <CR>"),
		dashboard.button("F", " " .. " find and replace", ":lua require('spectre').open()<CR>"),
	},
	opts = {
		hl = hl2,
		position = "center",
	},
}

local function config_section()
	local subtitle = " "
	local modified_dotfiles = require("user.dotfile-utils").modified_dotfiles()
	if tonumber(modified_dotfiles) ~= 0 then
		subtitle = " You have " .. modified_dotfiles .. "unsynchronized dotfile(s)"
	end
	return {
		type = "group",
		val = {
			{ type = "text", val = "config", opts = { hl = hl1, position = "center" } },
			dashboard.button("c", "  lazydotfiles", "<cmd>lua _LAZYGIT_DOTFILES_TOGGLE()<CR>"),
			dashboard.button("c 1", "  nvim", ":cd ~/.config/nvim/<CR> :e init.lua<CR>"),
			dashboard.button("c 2", "  sway", ":cd ~/.config/sway/<CR> :e config<CR>"),
			dashboard.button("c 3", "  waybar", ":cd ~/.config/sway/<CR> :e config<CR>"),
			dashboard.button("c 4", "  foot", ":e ~/.config/foot/foot.ini<CR>"),
			dashboard.button("c 5", "  fish", ":cd ~/.config/fish/<CR> :e config.fish<CR>"),
			{ type = "padding", val = 1 },
			{ type = "text", val = subtitle, opts = { hl = hl3, position = "center" } },
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
		{ type = "padding", val = 1 },
		header,
		{ type = "padding", val = 1 },
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
