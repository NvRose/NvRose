return function(config)
	vim.diagnostic.config(config.diagnostic)

	for k, v in pairs(config.icons) do
		local hl = "DiagnosticSign" .. k
		vim.fn.sign_define(hl, { text = v, numhl = hl, texthl = hl })
	end

	local on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		for _, v in ipairs(config.mappings) do
			vim.keymap.set(v[1], v[2], v[3], bufopts)
		end
	end

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	for k, v in pairs(config.servers) do
		v.capabilities = capabilities
		v.on_attach = on_attach
		require("lspconfig")[k].setup(v)
	end

	local group = vim.api.nvim_create_augroup("lsp", { clear = true })

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		group = group,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = {
					"BufLeave",
					"CursorMoved",
					"InsertEnter",
					"FocusLost",
				},
				border = "rounded",
				scope = "cursor",
			})
		end,
	})
end
