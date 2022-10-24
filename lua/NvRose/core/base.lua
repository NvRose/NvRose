return function(base)
	if base["trim"].enable then
		require("NvRose.base.trim")(base["trim"])
	end

	if base["terminal"].enable then
		require("NvRose.base.terminal").setup(base["terminal"].config)
	end

	if base["statusline"].enable then
		require("NvRose.base.statusline").setup()
	end

	if base["tabline"].enable then
		require("NvRose.base.tabline").setup(base["tabline"].config)
	end

	if base["resize"].enable then
		require("NvRose.base.resize").setup()
	end
end
