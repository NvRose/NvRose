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

	packer.use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdateSync",
		config = function()
			require("plugins.treesitter")
		end,
	})

	packer.use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	packer.use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})

	packer.use("lewis6991/impatient.nvim")

	packer.use("neovim/nvim-lspconfig")

	for plugin, options in pairs(plugins) do
		table.insert(options, plugin)
		packer.use(options)
	end
end
