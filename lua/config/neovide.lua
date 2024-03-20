if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.g.neovide_hide_mouse_when_typing = true
  -- vim.g.neovide_transparency = 0.9
  vim.g.neovide_scale_factor = 1
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<C-S-C>", '"+y') -- Copy
  vim.keymap.set("n", "<C-S-V", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-V>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-V", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-V>", '<ESC>l"+Pli') -- Paste insert mode
end