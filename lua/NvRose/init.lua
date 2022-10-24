for i, plugin in ipairs {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"matchparen",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"shada_plugin",
	"remote_plugins",
	"bugreport",
	"ftplugin",
	"archlinux",
	"fzf"
} do
	vim.g["loaded_" .. plugin] = 1
end

return function(config)
	vim.cmd.colorscheme(config.colorscheme)

	for option, value in pairs(config.vim.options) do
		vim.o[option] = value
	end

	if config.bootstrap then
		util.bootstrap()
	end

	vim.defer_fn(function()
		local core = require('NvRose.core')
		core.base(config.base)
		core.plugins(config.plugins)
	end, 0)
end
