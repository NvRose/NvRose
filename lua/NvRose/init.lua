vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

local core = require("NvRose.core")

core.providers()
core.runtime()

return function(config)
	vim.cmd.colorscheme(config.colorscheme)

	require(config.vim.mappings)

	if config.vim.lsp.enable then
		config.plugins["neovim/nvim-lspconfig"] = {}

		core.lsp(config.vim.lsp)
	end

	if config.autohide_cmd then
		local group = vim.api.nvim_create_augroup("CmdlineLeave", {})
		vim.api.nvim_create_autocmd("CmdlineEnter", {
			group = group,
			callback = function()
				vim.opt.cmdheight = 1
			end,
		})

		vim.api.nvim_create_autocmd("CmdlineLeave", {
			group = group,
			callback = function()
				vim.opt.cmdheight = 0
			end,
		})
	end

	vim.defer_fn(function()
		if config.bootstrap then
			require("NvRose.util").bootstrap()
		end

		core.base(config.base)
		core.plugins(config.plugins)
	end, 0)
end
