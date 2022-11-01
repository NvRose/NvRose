local map = vim.keymap.set

-- Disable c-z suspend
map("n", "<c-z>", "<Nop>")

-- Disable command-line window
map("n", "q:", "<Nop>")
map("n", "q/", "<Nop>")
map("n", "q?", "<Nop>")

-- Split moving
map({ "n", "i", "t" }, "<c-h>", "<c-w>h")
map({ "n", "i", "t" }, "<c-j>", "<c-w>j")
map({ "n", "i", "t" }, "<c-k>", "<c-w>k")
map({ "n", "i", "t" }, "<c-l>", "<c-w>l")

-- Split resizing
local resize = require("NvRose.base.resize")
map("n", "<c-s-h>", function()
	resize.left(1)
end)
map("n", "<c-s-j>", function()
	resize.up(1)
end)
map("n", "<c-s-k>", function()
	resize.down(1)
end)
map("n", "<c-s-l>", function()
	resize.right(1)
end)

-- Split opening
map("n", "<c-s>", "<cmd>sp<cr>")
map("n", "<c-c>", "<cmd>vs<cr>")

-- Quiting buffer
map("n", "qq", "<cmd>:q<cr>")

-- Searching
map("n", "<space>", "/")
map("n", "<s-space>", "?")

-- Goto begin/end of line
map("n", "<c-a>", "<Home>")
map("n", "<c-i>", "<End>")

-- Next found char
map("n", ".", ";")

-- Faster moving
map("n", "J", "5j")
map("n", "K", "5k")

-- telescope
map("n", "<c-n>", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<c-f>", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", ";", '<cmd>lua require("telescope.builtin").command_history()<cr>')
