vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Enable spell checking by default
vim.opt.spell = true
vim.g.mapleader = " "

vim.cmd("set number")
vim.cmd("set relativenumber")
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
-- require("plugins.lsp-config")
-- local builtin = require("telescope.builtin") vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", ":lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>")

-- Set nightfox as the default

vim.cmd.colorscheme("nightfox")
-- vim.api.nvim_create_autocmd("ColorScheme", {
--  callback = function()
--    vim.schedule(function()
--      vim.notify("Colorscheme: " .. vim.g.colors_name, vim.log.levels.INFO)
--    end)
--  end,
-- })

-- Move to window using the <ctrl> hjkl keys with descriptions
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {
    noremap = true,
    silent = true,
    desc = "Go to Left Window"
})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {
    noremap = true,
    silent = true,
    desc = "Go to Lower Window"
})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {
    noremap = true,
    silent = true,
    desc = "Go to Upper Window"
})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {
    noremap = true,
    silent = true,
    desc = "Go to Right Window"
})

-- Add keybindings for vertical split
vim.api.nvim_set_keymap('n', '<leader>w|', '<cmd>vsplit<CR>', {
    noremap = true,
    silent = true,
    desc = "Vertical Split"
})
vim.api.nvim_set_keymap('n', '<leader>wv', '<cmd>vsplit<CR>', {
    noremap = true,
    silent = true,
    desc = "Vertical Split"
})

-- Add keybinding for horizontal split
vim.api.nvim_set_keymap('n', '<leader>w-', '<cmd>split<CR>', {
    noremap = true,
    silent = true,
    desc = "Horizontal Split"
})
vim.api.nvim_set_keymap('n', '<leader>ws', '<cmd>split<CR>', {
    noremap = true,
    silent = true,
    desc = "Horizontal Split"
})

-- Add a keybinding to toggle terminal with Ctrl+"-" with description
vim.api.nvim_set_keymap('t', '<C-_>',
                        [[<C-\><C-n>:lua Snacks.terminal.toggle()<CR>]], {
    noremap = true,
    silent = true,
    desc = "Toggle Terminal"
})

-- Add a keybinding to use custom close window with description
vim.api.nvim_set_keymap('n', '<C-w>d', '<C-w>q',
                        {noremap = true, silent = true, desc = "Delete Window"})
-- Hide old 'q' Quit Window
vim.api.nvim_set_keymap('n', '<C-w>q', '<Nop>',
                        {noremap = true, silent = true, desc = "Delete Window"})

-- Add this to your init.lua file to map <leader>e in terminal mode
-- vim.api.nvim_set_keymap('t', '<leader>e', [[<C-\><C-n>:lua Snacks.explorer()<CR>]], { noremap = true, silent = true })

