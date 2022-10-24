local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if ok then
	treesitter.setup {
		indent = {
			enable = true
  		},

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false
		}
	}
end
