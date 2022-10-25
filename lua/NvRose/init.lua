vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

local core = require("NvRose.core")

core.providers()
core.runtime()

return function(config)
	vim.cmd.colorscheme(config.colorscheme)

	core.mappings(config.vim.mappings)

	for option, value in pairs(config.vim.options) do
		vim.o[option] = value
	end

	vim.defer_fn(function()
		if config.bootstrap then
			require("NvRose.util").bootstrap()
		end

		core.base(config.base)

		if config.vim.lsp.enable then
			config.plugins["neovim/nvim-lspconfig"] = {
				config = core.lsp(config.vim.lsp),
			}
		end

		core.plugins(config.plugins)
	end, 0)
end
