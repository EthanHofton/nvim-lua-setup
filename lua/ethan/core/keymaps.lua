local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>_", "<C-x>")

keymap.set("n", "<leader>|", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")  -- find files
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")   -- find text
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find current string cursor is on
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- show buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")   -- show help tags
