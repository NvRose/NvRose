return function(plugins)
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		print("Installing dependencies...")

		vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})

		require("NvRose.core").plugins(plugins)

		vim.cmd("PackerSync")
	end
end
