local core = require("NvRose.core")

return function(config)
	vim.cmd.colorscheme(config.colorscheme)

	core.providers()
	core.runtime()
	core.mappings(config.vim.mappings)

	for option, value in pairs(config.vim.options) do
		vim.o[option] = value
	end

	if config.bootstrap then
		util.bootstrap()
	end

	if config.vim.lsp.enable then
		config.plugins["neovim/nvim-lspconfig"] = {
			config = core.lsp(config.vim.lsp),
		}
	end

	vim.defer_fn(function()
		core.base(config.base)
		core.plugins(config.plugins)
	end, 0)
end
