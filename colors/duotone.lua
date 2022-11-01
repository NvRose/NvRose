vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "duotone"
vim.o.background = "dark"
vim.o.termguicolors = true

vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		local m = vim.fn.mode()

		if m == "v" or m == "V" then
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#1e1e2e", fg = "#F2CDCD", bold = true })
		elseif m == "i" or m == "ic" or m == "ix" then
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#1e1e2e", fg = "#F2CDCD", bold = true })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e1e2e" })
		else
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181825" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#181825", fg = "#F2CDCD", bold = true })
		end
	end,
})

-- VIM
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bold = true })

vim.api.nvim_set_hl(0, "SignColumn", { fg = "#45475A" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#181825" })
vim.api.nvim_set_hl(0, "Todo", { fg = "#F9E2AF", bold = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#9399B2" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#F5C2E7" })
vim.api.nvim_set_hl(0, "MatchParen", { link = "@string.escape" })
vim.api.nvim_set_hl(0, "String", { link = "@string" })
vim.api.nvim_set_hl(0, "Label", { link = "@string.escape" })
vim.api.nvim_set_hl(0, "Special", { link = "@string.escape" })
vim.api.nvim_set_hl(0, "StorageClass", { link = "@string.escape" })
vim.api.nvim_set_hl(0, "Constant", { link = "@string" })
vim.api.nvim_set_hl(0, "cssDefinition", { link = "@string.escape" })
vim.api.nvim_set_hl(0, "Number", { link = "@number" })
vim.api.nvim_set_hl(0, "StatusLineFill", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#181825", fg = "#F2CDCD", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#9399B2" })
vim.api.nvim_set_hl(0, "Visual", { bold = true, bg = "#45475A" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "#181825" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#1e1e2e", bg = "#F2CDCD", bold = true })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PreProc", { link = "@constant.macro" })
vim.api.nvim_set_hl(0, "Type", { link = "@type" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#F2CDCD" })
vim.api.nvim_set_hl(0, "Statement", { link = "@conditional" })
vim.api.nvim_set_hl(0, "Conceal", { fg = "#7F849C" })
vim.api.nvim_set_hl(0, "VertSplit", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "Comment", { link = "@comment" })

-- TREESITTER
vim.api.nvim_set_hl(0, "@constant.macro", { fg = "#B4BEFE" })
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant.macro" })
vim.api.nvim_set_hl(0, "@include", { link = "@constant.macro" })
vim.api.nvim_set_hl(0, "@preproc", { link = "@constant.macro" })
vim.api.nvim_set_hl(0, "@field", { link = "@constant.macro" })

vim.api.nvim_set_hl(0, "@string", { fg = "#f9bcae" })

vim.api.nvim_set_hl(0, "@constant", { fg = "#CBA6F7" })

vim.api.nvim_set_hl(0, "@number", { fg = "#F2CDCD" })
vim.api.nvim_set_hl(0, "@boolean", { link = "@number" })
vim.api.nvim_set_hl(0, "@string.escape", { fg = "#EBA0AC" })
vim.api.nvim_set_hl(0, "@error", { link = "@strin.escape" })

vim.api.nvim_set_hl(0, "@keyword", { link = "@constant.macro" })
vim.api.nvim_set_hl(0, "@type", { fg = "#cba6f7", italic = true })
vim.api.nvim_set_hl(0, "@comment", { fg = "#9399B2", italic = true })

vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#9399B2" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#9399B2", bold = true })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#F5C2E7" })
vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@tag.delimiter" })
vim.api.nvim_set_hl(0, "@punctuation.special", { link = "@tag.delimiter" })
vim.api.nvim_set_hl(0, "@constructor", { fg = "#CBA6F7" })
vim.api.nvim_set_hl(0, "@exception", { fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "@method", { fg = "#89B4FA" })

vim.api.nvim_set_hl(0, "@variable", { fg = "#CDD6F4" })
vim.api.nvim_set_hl(0, "@parameter", { link = "@variable" })
vim.api.nvim_set_hl(0, "@operator", { fg = "#eba0ac" })
vim.api.nvim_set_hl(0, "@function", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "@function.macro", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "@property", { link = "@include" })
vim.api.nvim_set_hl(0, "@conditional", { fg = "#CBA6F7", bold = true })
vim.api.nvim_set_hl(0, "@repeat", { link = "@conditional" })

vim.api.nvim_set_hl(0, "@text.danger", { fg = "#F38BA8", bold = true })
vim.api.nvim_set_hl(0, "@text.title", { bold = true, fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "@text.warning", { fg = "#F9E2AF", bold = true })
vim.api.nvim_set_hl(0, "@text.note", { fg = "#89b4fa", bold = true })

-- LSP DIAGNOSTIC
vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "NONE", fg = "#94E2D5" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "NONE", fg = "#89DCEB" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "NONE", fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "NONE", fg = "#F38BA8" })

vim.api.nvim_set_hl(0, "LspDiagnosticsError", { bg = "#181825" })
vim.api.nvim_set_hl(0, "LspDiagnosticsWarning", { link = "@LspDiagnosticsError" })
vim.api.nvim_set_hl(0, "LspDiagnosticsInfo", { link = "@LspDiagnosticsError" })
vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { link = "@LspDiagnosticsError" })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, sp = "#94E2D5" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "#F38BA8" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = "#F9E2AF" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, sp = "#89DCEB" })

vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#94E2D5" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#89DCEB" })

-- PLUGINS
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "@string" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#FAB387" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FAB387" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#CBA6F7" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#F2CDCD" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#F38BA8" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#F38BA8" })

vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })

vim.api.nvim_set_hl(0, "NormalMode", { bg = "#89B4FA", fg = "#1e1e2e", bold = true })
vim.api.nvim_set_hl(0, "TermMode", { bg = "#cba6f7", fg = "#1e1e2e", bold = true })
vim.api.nvim_set_hl(0, "InsertMode", { bg = "#94E2D5", fg = "#1e1e2e", bold = true })
vim.api.nvim_set_hl(0, "CmdMode", { bg = "#F9E2AF", fg = "#1e1e2e", bold = true })
vim.api.nvim_set_hl(0, "VisualMode", { bg = "#f9bcae", fg = "#1e1e2e", bold = true })

vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "DiagnosticFloatingError" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bold = true, fg = "#F2CDCD", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bold = true, fg = "#F2CDCD" })
vim.api.nvim_set_hl(0, "TelescopePromptCounter", { bold = true, fg = "#1e1e2e" })

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#89B4FA" })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#CBA6F7" })
vim.api.nvim_set_hl(0, "DashboardFooter", { italic = true, fg = "#F9E2AF" })
vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#a6afc8" })