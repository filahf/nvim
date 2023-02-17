return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  dependencies = { { "nvim-telescope/telescope.nvim" } },
  config = function()
    local project = require("project_nvim")
    local telescope = require("telescope")
    project.setup({
      -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },
      -- patterns used to detect root dir, when **"pattern"** is in detection_methods
      patterns = { ".git", "Makefile", "package.json" },
    })

    telescope.load_extension("projects")
  end,
}
