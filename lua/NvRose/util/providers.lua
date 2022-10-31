return function()
	for _, provider in ipairs {
		"node", "perl", "python3", "ruby"
	} do
		vim.g["loaded_" .. provider .. "_provider"] = 0
	end
end
