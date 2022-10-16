require 'base'

-- PLUGINS --

use {
	'NvRose/terminal.nvim',
	config = function()
		require('terminal').setup()
	end
}

use {
	'NvRose/statusline.nvim',
 	config = function()
		require('statusline').setup()
	end
}

use {
	'NvRose/tabline.nvim',
	config = function()
		require('tabline').setup()
	end
}

-- instand of netrw plugins
use {
	'nvim-tree/nvim-tree.lua',
	requires = { 'nvim-tree/nvim-web-devicons' },
	tag = 'nightly',
	cmd = {
		'NvimTreeToggle',
		'NvimTreeFocus',
		'NvimTreeFindFile',
		'NvimTreeCollapse'
	},
	config = function()
		require("nvim-tree").setup {
			auto_reload_on_write = false,
			hijack_netrw = false,
			create_in_closed_folder = false,
			view = {
				hide_root_folder = true,
			},
			git = { enable = false },
		}
	end
}

use {
	'catppuccin/nvim',
	as = 'catppuccin',
	run = ':CatppuccinCompile',
	config = function()
		require('catppuccin').setup {
			transparent_background = true,
			term_colors = true,
			integrations = {
				treesitter = true,
				telescope  = true,
				cmp        = true,
				nvimtree   = true
			},

			custom_highlights = {
				NormalFloat = { bg = "#1e1e2e" },
				Pmenu = { bg = "#1e1e2e" },
				Tab = { fg = "#a6afc8" },
				TabSel = { fg = "#a6e3a1", style = { "bold" } },
				NormalMode = { fg = "#a6e3a1", style = { "bold" } },
				InsertMode = { fg = "#89b4fa", style = { "bold" } },
				CmdMode = { fg = "#f9e2af", style = { "bold" } },
				TermMode = { fg = "#cba6f7", style = { "bold" }},
				NvimTreeVertSplit = { fg = "#45475a" },
				CursorLine = { bg = "NONE" },
			}
		}

		au("User", {
			pattern = "PackerCompileDone",
			callback = function()
				vim.cmd "CatppuccinCompile"
				vim.defer_fn(function()
					colorscheme 'catppuccin'
				end, 0)
			end
		})
	end
}

use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	config = function()
		local actions = require 'telescope.actions'

		require 'telescope'.setup {
			defaults = {
				set_env = { COLORTERM = 'truecolor' },
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = " ",

				file_ignore_patterns = {
					'.git/',
					'%.o',
					'packer_compiled.lua'
				},

				mappings = {
					i = {
						["<esc>"] = actions.close,
					}
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					preview_title = false,
				},
				live_grep = {
					theme = "dropdown",
					preview_title = false,
				}
			}
		}
	end
}

use {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup {
			padding = true,
			sticky = true,
			ignore = nil,
			opleader = { block = '<c-_>' },
			toggler = { block = '<c-_>' }
		}
	end
}

use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	setup = function()
		vim.api.nvim_create_autocmd({
			'BufRead', 'BufWinEnter', 'BufNewFile'
		}, {
			group = vim.api.nvim_create_augroup('LazyTreesitter', {}),
			callback = function()
				packer.loader('nvim-treesitter')
				require'nvim-treesitter.configs'.setup {
					auto_install = true,
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false
					}
				}
			end
		})
	end,
	cmd = {
		'TSInstall',
		'TSBufEnable',
		'TSBufDisable',
		'TSEnable',
		'TSDisable',
		'TSModuleInfo'
	}
}

use {
	'hrsh7th/nvim-cmp',
	requires = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		{ 'L3MON4D3/LuaSnip', run = "make install_jsregexp" },
		'saadparwaiz1/cmp_luasnip'

	},
	config = function()
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
		end

		local luasnip = require 'luasnip'
		local cmp = require 'cmp'
		cmp.setup {
			window = {
				completion = {
					border = "rounded"
				},

				documentation = {
					border = "rounded"
				}
			},

			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item {
							behavior = cmp.SelectBehavior.Select
						}
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item {
							behavior = cmp.SelectBehavior.Select
						}
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				['<c-space>'] = cmp.mapping.complete(),

				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				}
			},

			sources = cmp.config.sources {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			}
		}
	end
}

use {
	'windwp/nvim-autopairs',
	config = function()
		require 'nvim-autopairs'.setup()
	end
}

-- USER INTERFACE --

colorscheme 'catppuccin'

lsp_icons {
	['Error'] = '',
	['Warn']  = '',
	['Info']  = '',
	['Hint']  = ''
}

diagnostic.config {
	virtual_text     = false,
	signs            = true,
	underline        = true,
	update_in_insert = false
}

-- NEOVIM OPTIONS --

g.mapleader   = ' '
opt.clipboard = 'unnamedplus'
opt.wrap      = false
opt.ls        = 3
opt.ru	      = false
opt.smd	      = false
opt.cul       = true
opt.nu        = true
opt.sb        = true
opt.spr       = true
opt.scl       = 'number'
opt.tgc       = true
opt.ch        = 0
opt.ut        = 250
opt.hls       = false
opt.shm:append "scIaWqC"

-- KEY MAPPINGS --

map('n', ']d', vim.diagnostic.goto_next)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gf', function()
	return vim.lsp.buf.code_action {
		apply = true
	}
end)

map('n', '<c-o>', '<cmd>NvimTreeToggle<cr>')

local ts_builtin = require('telescope.builtin')
map('n', '<c-n>', ts_builtin.find_files)
map('n', '<c-f>', ts_builtin.live_grep)
map('n', ';',     ts_builtin.command_history)
map('n', '<c-\\>', require('terminal').new)

-- AUTOMATIC COMMANDS --

au('BufWrite', {
	pattern = '*', command = [[ sil! :%s#\($\n\s*\)\+\%$## | :%s/\s\+$//e ]]
})

-- LSP --

lsp.clangd.setup { -- example, you can take configs from mason-nvim
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	restartAfterCrash = true,
	detectExtensionConflicts = true,
	semanticHighlighting = true,
	serverCompletionRanking = true
}
