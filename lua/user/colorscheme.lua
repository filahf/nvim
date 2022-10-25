local colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"
vim.g.catppuccin_transparent_background = true
vim.g.cattppuccin_italic_comments = true
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
