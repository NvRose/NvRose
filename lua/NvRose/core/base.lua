return function(base)
	if base['trim'].enable then
		require('NvRose.base.trim')(base['trim'])
	end

	if base['terminal'].enable then
		require('NvRose.base.terminal').setup(base['terminal'].config)
	end
end
