local map = vim.keymap.set

-- Disable c-z suspend
map("n", "<c-z>", "<Nop>")

-- Disable command-line window
map("n", "q:", "<Nop>")
map("n", "q/", "<Nop>")
map("n", "q?", "<Nop>")

-- Split moving
map("i", "<c-h>", [[<C-\><C-N><C-w>h]])
map("i", "<c-j>", [[<C-\><C-N><C-w>j]])
map("i", "<c-k>", [[<C-\><C-N><C-w>k]])
map("i", "<c-l>", [[<C-\><C-N><C-w>l]])
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
map("t", "<c-h>", [[<C-\><C-N><C-w>h]])
map("t", "<c-j>", [[<C-\><C-N><C-w>j]])
map("t", "<c-k>", [[<C-\><C-N><C-w>k]])
map("t", "<c-l>", [[<C-\><C-N><C-w>l]])

-- Split resizing
local resize = require("NvRose.base.resize")
map("n", "<c-s-h>", function()
	resize.left(1)
end)
map("n", "<c-s-j>", function()
	resize.down(1)
end)
map("n", "<c-s-k>", function()
	resize.up(1)
end)
map("n", "<c-s-l>", function()
	resize.right(1)
end)

-- Searching
map("n", "<space>", "/")
map("n", "<s-space>", "?")

-- Goto begin/end of line
map("n", "<c-a>", "<Home>")
map("n", "<c-i>", "<End>")

-- Next found char
map("n", ".", ";")

-- telescope
map("n", "<c-n>", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<c-f>", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", ";", '<cmd>lua require("telescope.builtin").command_history()<cr>')
