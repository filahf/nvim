-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "txt" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.cmd("autocmd FocusGained * checktime")

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.conf", "*.env.*", "*.env" },
  callback = function()
    vim.cmd("setfiletype  dosini")
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
