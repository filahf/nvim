return {
  "echasnovski/mini.map",
  version = false,
  config = function()
    local map = require("mini.map")
    local diagnostic_integration = map.gen_integration.diagnostic({
      error = "DiagnosticFloatingError",
      warn = "DiagnosticFloatingWarn",
      info = "DiagnosticFloatingInfo",
      hint = "DiagnosticFloatingHint",
    })
    local gitsigns_integration = map.gen_integration.gitsigns()
    map.setup({ integrations = { diagnostic_integration, gitsigns_integration } })
  end,
}
