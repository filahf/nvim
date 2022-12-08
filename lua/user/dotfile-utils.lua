local M = {}
local dotfiles = "git --git-dir=$HOME/dotfiles --work-tree=$HOME"

local function dir_exists(path)
	if type(path) ~= "string" then
		error("input error")
		return false
	end
	local response = os.execute("cd " .. path)
	if response == nil then
		return false
	end
	return response
end

M.modified_dotfiles = function()
	if dir_exists("$HOME/dotfiles/") then
		local command = (dotfiles .. " status -s -uno | wc -l")
		local handle = io.popen(command)
		if not handle then
			return false
		end
		local result = handle:read("*a")
		handle:close()
		return result:gsub("[\n\r]", " ")
	end
	return false
end

return M
