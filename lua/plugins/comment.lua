return function()
	local ok, comment = pcall(require, 'Comment')

	if ok then
		comment.setup {
			padding = true,
			sticky = true,
			ignore = nil,
			opleader = { block = '<c-/>' },
			toggler = { block = '<c-/>' }
		}
	end
end
