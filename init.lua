vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.cmd("set number")
vim.cmd("set relativenumber")
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
--require("plugins.lsp-config")
--local builtin = require("telescope.builtin") vim.keymap.set("n", "<C-p>", builtin.find_files, {})
--vim.keymap.set("n", "<leader>fg", ":lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>")
