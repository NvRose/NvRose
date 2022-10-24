return {
	{ 'n', '<c-z>', '<Nop>' }, -- Disable c-z suspend

	-- Disable command-line window
	{ 'n', 'q:', '<Nop>' },
	{ 'n', 'q/', '<Nop>' },
	{ 'n', 'q?', '<Nop>' },

	{ 'n', '<c-n>', '<cmd>lua require("telescope.builtin").find_files()<cr>'      },
	{ 'n', '<c-f>', '<cmd>lua require("telescope.builtin").live_grep()<cr>'       },
	{ 'n', ';',     '<cmd>lua require("telescope.builtin").command_history()<cr>' }
}
