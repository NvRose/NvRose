return function(mappings)
	for _, v in ipairs(mappings) do
		vim.keymap.set(v[1], v[2], v[3])
	end
end
