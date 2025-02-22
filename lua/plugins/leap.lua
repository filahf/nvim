return {
  {
    "ggandor/leap.nvim",
    -- enabled = true,
    -- keys = {
    -- { "<CR>", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
    -- { "S",  mode = { "n", "x", "o" }, desc = "Leap Backward to" },
    -- { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
    -- },
    -- config = function(_, opts)
    --   local leap = require("leap")
    --   for k, v in pairs(opts) do
    --     leap.opts[k] = v
    --   end
    -- leap.add_default_mappings(true)
    -- end,
  },
  {
    "ggandor/flit.nvim",
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
}
