vim.cmd("packadd packer.nvim")

local packer = require("packer")

return function(plugins)
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

	packer.use({
		"wbthomason/packer.nvim",
		cmd = {
			"PackerSnapshot",
			"PackerSnapshotRollback",
			"PackerSnapshotDelete",
			"PackerInstall",
			"PackerUpdate",
			"PackerSync",
			"PackerClean",
			"PackerCompile",
			"PackerStatus",
			"PackerProfile",
			"PackerLoad",
		},
	})

	for plugin, options in pairs(plugins) do
		table.insert(options, plugin)
		packer.use(options)
	end
end
