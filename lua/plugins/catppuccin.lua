local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
	catppuccin.setup {
		flavour = "mocha",

		integrations = {
			treesitter = true
		},

		indent = {
			enable = true
		}
	}
end
