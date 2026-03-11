local telescope = require("telescope.builtin")

-- File search
vim.keymap.set("n", "<leader>ff", function()
	telescope.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

-- File browsing
vim.keymap.set("n", "<leader>fn", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- LSP commands
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {})

-- Editor commands
vim.keymap.set("n", "<BS>", "ciw")
vim.keymap.set({ "n", "i" }, "<C-l>", ":noh<CR>") -- Clear search highlighting
vim.keymap.set("n", "<leader>ge", ":e#<CR>")

-- Git control
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gv", ":DiffviewOpen<CR>")

-- Window navigation
vim.keymap.set("n", "<leader>ml", "<C-W>l")
vim.keymap.set("n", "<leader>mk", "<C-W>k")
vim.keymap.set("n", "<leader>mj", "<C-W>j")
vim.keymap.set("n", "<leader>mh", "<C-W>h")
