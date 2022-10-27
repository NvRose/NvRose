local ok, catppuccin = pcall(require, "catppuccin")

if ok then
	catppuccin.setup({
		transparent_background = true,
		term_colors = true,
		flavour = "mocha",

		integrations = {
			treesitter = true,
			telescope = true,
			cmp = true,
		},

		indent = {
			enable = true,
		},

		custom_highlights = {
			PmenuSel = { bg = "NONE", style = { "bold" } },

			LspDiagnosticsError = { bg = "#181825" },
			LspDiagnosticsWarning = { bg = "#181825" },
			LspDiagnosticsInfo = { bg = "#181825" },
			LspDiagnosticsHint = { bg = "#181825" },

			-- Statusline
			NormalMode = { bg = "#a6e3a1", fg = "#1e1e2e", style = { "bold" } },
			InsertMode = { bg = "#89b4fa", fg = "#1e1e2e", style = { "bold" } },
			CmdMode = { bg = "#f9e2af", fg = "#1e1e2e", style = { "bold" } },
			TermMode = { bg = "#cba6f7", fg = "#1e1e2e", style = { "bold" } },

			-- Tabline
			TabLine = { fg = "#a6afc8" },
			TabLineSel = { bg = "#a6e3a1", fg = "#1e1e2e", style = { "bold" } },
			TabLineModified = { bg = "#f9e2af", fg = "#1e1e2e", style = { "bold" } },

			StatusLineFill = { bg = "#181825" },
		},
	})
end
