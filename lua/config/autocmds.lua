-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Don't auto comment new lines
autocmd("BufEnter", { pattern = "", command = "set fo-=c fo-=r fo-=o" })

-- Remove whitespace on save
autocmd("BufWritePre", { pattern = "", command = ":%s/\\s\\+$//e" })

-- Open Neotree in left window on startup (left | right | float)
augroup("NeotreeAutoOpen", { clear = true })
autocmd("VimEnter", { group = "NeotreeAutoOpen", command = "Neotree left" })

vim.b.autoformat = true -- Disable globally
