return function()
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
end