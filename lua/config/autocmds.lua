-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Don't auto comment new lines
autocmd("BufEnter", {pattern = "", command = "set fo-=c fo-=r fo-=o"})

-- Remove whitespace on save
autocmd("BufWritePre", {pattern = "", command = ":%s/\\s\\+$//e"})

-- Open Neotree in left window on startup (left | right | float)
augroup("NeotreeAutoOpen", {clear = true})
autocmd("VimEnter", {group = "NeotreeAutoOpen", command = "Neotree left"})

vim.b.autoformat = true -- Disable globally

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
            content = content:gsub('vim.cmd.colorscheme%(".-"%)',
                                   'vim.cmd.colorscheme("' .. current .. '")')
        else
            content = content ..
                          '\n\n-- Set default colorscheme\nvim.cmd.colorscheme("' ..
                          current .. '")\n'
        end

        -- Write back to the file
        local file = io.open(init_file, "w")
        if file then
            file:write(content)
            file:close()
            vim.notify("Default colorscheme set to " .. current,
                       vim.log.levels.INFO)
        else
            vim.notify("Failed to write to " .. init_file, vim.log.levels.ERROR)
        end
    else
        vim.notify("No colorscheme is currently set", vim.log.levels.ERROR)
    end
end, {})

-- Add a keymap to set the current colorscheme as default
vim.keymap.set("n", "<leader>cd",
               function() vim.cmd("SetCurrentColorschemeAsDefault") end,
               {desc = "Set Default Colorscheme"})

-- Detect Cairo files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cairo",
    callback = function() vim.bo.filetype = "cairo" end
})
