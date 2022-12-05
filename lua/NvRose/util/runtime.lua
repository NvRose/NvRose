return function()
	for _, plugin in ipairs({
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
		"fzf",
	}) do
		vim.g["loaded_" .. plugin] = 1
	end

	vim.g.did_load_filetypes = 1

	vim.opt.runtimepath:remove("/etc/xdg/nvim")
	vim.opt.runtimepath:remove("/etc/xdg/nvim/after")
	vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
	vim.opt.runtimepath:remove("/usr/share/nvim/runtime/plugin")
end
