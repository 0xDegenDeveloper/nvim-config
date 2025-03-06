-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Colorscheme keymaps with descriptions
-- vim.keymap.set("n", "<leader>cc", function()
  -- -- Get current colorscheme
  -- local current_scheme = vim.g.colors_name or ""
  
  -- local colorschemes = {
    -- { name = "catppuccin" },
    -- { name = "tokyonight" },
    -- { name = "kanagawa" },
    -- { name = "nightfox" },
    -- { name = "rose-pine" },
  -- }

  -- -- Format items for the selector
  -- local items = {}
  -- for _, scheme in ipairs(colorschemes) do
    -- local indicator = scheme.name == current_scheme and " ● " or "   "
    -- table.insert(items, indicator .. scheme.name)
  -- end

  -- vim.ui.select(
    -- items,
    -- { prompt = "Select Colorscheme (● = current)" },
    -- function(selected)
      -- if selected then
        -- -- Extract just the colorscheme name from the selection
        -- local selected_name = selected:match("^%s*●?%s*(.+)$")
        
        -- -- Apply the selected colorscheme
        -- vim.cmd.colorscheme(selected_name)
        
        -- -- Show a notification with the selected theme
        -- vim.notify("Colorscheme changed to " .. selected_name, vim.log.levels.INFO)
      -- end
    -- end
  -- )
-- end, { desc = "Select Colorscheme", priority = 1000 })

-- Add a keybinding to toggle terminal with Ctrl+J
map({ "n", "i", "t" }, "<C-j>", function()
  if _G.Snacks and Snacks.terminal then
    Snacks.terminal.toggle()
  end
end, { desc = "Toggle Terminal" })

-- Add this to your keymaps.lua file
map("t", "<C-/>", [[<C-\><C-n>:lua Snacks.terminal.toggle()<CR>]], { desc = "Toggle Terminal" })
map("t", "<C-_>", [[<C-\><C-n>:lua Snacks.terminal.toggle()<CR>]], { desc = "Toggle Terminal" })
