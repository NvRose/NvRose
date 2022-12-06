local impatient_ok, impatient = pcall(require, "impatient")

local core = require("NvRose.core")

core.providers()
core.runtime()

return function(config)
	require("NvRose.util.bootstrap")(config.plugins)

	if config.colorscheme then
		vim.api.nvim_command("colorscheme " .. config.colorscheme)
	end

	if config.startup_profile and impatient_ok then
		impatient.enable_profile()
	end

	if config.base["tabline"].enable then
		config.plugins["nvim-tree/nvim-web-devicons"] = {}
	end

	if config.snippets then
		require("snippet")
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

	core.base(config.base)
	core.lsp(config.vim.lsp)
end
