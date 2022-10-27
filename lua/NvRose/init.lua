vim.defer_fn(function()
	pcall(require, "impatient")

	require("impatient").enable_profile()
end, 0)

local core = require("NvRose.core")

core.providers()
core.runtime()

return function(config)
	vim.cmd.colorscheme(config.colorscheme)

	require(config.vim.mappings)

	for option, value in pairs(config.vim.options) do
		vim.o[option] = value
	end

	if config.vim.lsp.enable then
		config.plugins["neovim/nvim-lspconfig"] = {}

		core.lsp(config.vim.lsp)
	end

	vim.defer_fn(function()
		if config.bootstrap then
			require("NvRose.util").bootstrap()
		end

		core.base(config.base)
		core.plugins(config.plugins)
	end, 0)
end
