-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.neovide")
require("config.options")
require("config.keymaps")
require("config.autocommands")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
require("config.lsp.config")
require("config.lsp.setup")
require("config.lsp.functions")
