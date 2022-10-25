local status_ok, map = pcall(require, "mini.map")
if not status_ok then
	return
end

map.setup({
	integrations = {
		map.gen_integration.builtin_search(),
		map.gen_integration.gitsigns(),
		map.gen_integration.diagnostic(),
	},
})
