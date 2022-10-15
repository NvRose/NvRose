vim.defer_fn(function()
	pcall(require, 'impatient')
end, 0)

-- Packer bootstrap
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
end

vim.cmd 'packadd packer.nvim'

packer = require('packer')

packer.init {
		auto_clean = true,
		compile_on_sync = true,
		auto_reload_compiled = true,
		display = {
			open_fn = function()
				return require 'packer.util'.float {
					border = 'single'
				}
			end
		}
}

-- Handy api bindings
use = packer.use
map = vim.keymap.set
au = vim.api.nvim_create_autocmd
cmd = vim.cmd
colorscheme = cmd.colorscheme
opt = vim.opt
g = vim.g
diagnostic = vim.diagnostic

-- Add packer itself
use {
	'wbthomason/packer.nvim',
	cmd = {
		'PackerSnapshot',
		'PackerSnapshotRollback',
		'PackerSnapshotDelete',
		'PackerInstall',
		'PackerUpdate',
		'PackerSync',
		'PackerClean',
		'PackerCompile',
		'PackerStatus',
		'PackerProfile',
		'PackerLoad'
	}
}

use {
	-- Add impatient and plenary by default to speedup neovim startup times
	'lewis6991/impatient.nvim',
	'nvim-lua/plenary.nvim',
	-- Lspconfig for setting neovim's builtin lsp
	'neovim/nvim-lspconfig'
}

lsp = require 'lspconfig'

-- Disable builtins to improve startup times
local default_plugins = {
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
	"bugreport",
	"ftplugin",
	"archlinux",
	"fzf"
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

-- Disable neovim default providers
local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby"
}

for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end

function lsp_icons(icons)
	for k, v in pairs(icons) do
		local hl = "DiagnosticSign" .. k
		vim.fn.sign_define(hl, {
			text = v, numhl = hl, texthl = hl
		})
	end
end

vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = {
				"BufLeave", "CursorMoved",
				"InsertEnter", "FocusLost"
			},
			border = 'rounded',
			source = 'never',
			prefix = ' ',
			scope = 'cursor'
		}
		vim.diagnostic.open_float(nil, opts)
	end
})

-- Uncomment to view profiling data by :LuaCacheProfile
-- require'impatient'.enable_profile()
