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
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
  noremap = true,
  silent = true,
  desc = "Go to Left Window",
})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
  noremap = true,
  silent = true,
  desc = "Go to Lower Window",
})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
  noremap = true,
  silent = true,
  desc = "Go to Upper Window",
})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
  noremap = true,
  silent = true,
  desc = "Go to Right Window",
})

-- Add keybindings for vertical split
vim.api.nvim_set_keymap("n", "<leader>w|", "<cmd>vsplit<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
})
vim.api.nvim_set_keymap("n", "<leader>wv", "<cmd>vsplit<CR>", {
  noremap = true,
  silent = true,
  desc = "Vertical Split",
})

-- Add keybinding for horizontal split
vim.api.nvim_set_keymap("n", "<leader>w-", "<cmd>split<CR>", {
  noremap = true,
  silent = true,
  desc = "Horizontal Split",
})
vim.api.nvim_set_keymap("n", "<leader>ws", "<cmd>split<CR>", {
  noremap = true,
  silent = true,
  desc = "Horizontal Split",
})

-- Add a keybinding to toggle terminal with Ctrl+"-" with description
vim.api.nvim_set_keymap("t", "<C-_>", [[<C-\><C-n>:lua Snacks.terminal.toggle()<CR>]], {
  noremap = true,
  silent = true,
  desc = "Toggle Terminal",
})

-- Add a keybinding to use custom close window with description
vim.api.nvim_set_keymap("n", "<C-w>d", "<C-w>q", { noremap = true, silent = true, desc = "Delete Window" })
-- Hide old 'q' Quit Window
vim.api.nvim_set_keymap("n", "<C-w>q", "<Nop>", { noremap = true, silent = true, desc = "Delete Window" })

-- Add this to your init.lua file to map <leader>e in terminal mode
-- vim.api.nvim_set_keymap('t', '<leader>e', [[<C-\><C-n>:lua Snacks.explorer()<CR>]], { noremap = true, silent = true })

-- Add a command to set the current colorscheme as default
vim.api.nvim_create_user_command("SetCurrentColorschemeAsDefault", function()
  -- Get the current colorscheme
  local current = vim.g.colors_name

  if current and current ~= "" then
    -- Update the init.lua file to set this colorscheme
    local init_file = vim.fn.stdpath("config") .. "/init.lua"
    local content = io.open(init_file, "r"):read("*all")

    -- Replace or add the colorscheme line
    if content:find("vim.cmd.colorscheme%(") then
      content = content:gsub('vim.cmd.colorscheme%(".-"%)', 'vim.cmd.colorscheme("' .. current .. '")')
    else
      content = content .. '\n\n-- Set default colorscheme\nvim.cmd.colorscheme("' .. current .. '")\n'
    end

    -- Write back to the file
    local file = io.open(init_file, "w")
    if file then
      file:write(content)
      file:close()
      vim.notify("Default colorscheme set to " .. current, vim.log.levels.INFO)
    else
      vim.notify("Failed to write to " .. init_file, vim.log.levels.ERROR)
    end
  else
    vim.notify("No colorscheme is currently set", vim.log.levels.ERROR)
  end
end, {})

-- Add a keymap to set the current colorscheme as default
vim.keymap.set("n", "<leader>cP", function()
  vim.cmd("SetCurrentColorschemeAsDefault")
end, { desc = "Set Colorscheme" })

-- Detect Cairo files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.cairo",
  callback = function()
    vim.bo.filetype = "cairo"
  end,
})

-- Close the tree explorer and open the dashboard on launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Move to open window
    vim.cmd("wincmd l")
    -- Open the dashboard
    vim.cmd("Dashboard")
    -- Move to explorer window
    vim.cmd("wincmd h")
  end,
})
