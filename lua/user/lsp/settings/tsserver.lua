local function setup(on_attach, capabilities)
  require("typescript").setup({
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  })
end

return {
  setup = setup,
}
