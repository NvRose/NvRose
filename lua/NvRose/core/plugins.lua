return function(plugins)
	vim.cmd("packadd packer.nvim")

	local packer = require("packer")

	packer.init({
		auto_clean = true,
		compile_on_sync = true,
		auto_reload_compiled = true,
		profile = {
			enable = false,
		},
		display = {
			working_sym = "ﲊ",
			error_sym = "✗ ",
			done_sym = " ",
			removed_sym = " ",
			moved_sym = "",
			open_fn = function()
				return require("packer.util").float({
					border = "single",
				})
			end,
		},
	})

	packer.use("wbthomason/packer.nvim")

	for k, v in pairs(plugins) do
		if type(v) == "string" then
			packer.use(v)
		else
			table.insert(v, k)
			packer.use(v)
		end
	end
end
