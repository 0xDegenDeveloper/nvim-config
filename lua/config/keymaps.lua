-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local map = LazyVim.safe_keymap_set

-- map({ "n" }, "<leader>cf", ":%!jq .<CR>", { desc = "JSON Formatter" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Colorscheme keymaps with descriptions
vim.keymap.set("n", "<leader>cc", function()
  -- Get current colorscheme
  local current_scheme = vim.g.colors_name or ""
  
  -- Special case for cobalt2 which might not set colors_name properly
  if not current_scheme or current_scheme == "" then
    if package.loaded["colorbuddy"] and package.loaded["colorbuddy"].colorscheme_name == "cobalt2" then
      current_scheme = "cobalt2"
    end
  end
  
  local colorschemes = {
    { name = "cobalt2" },
    { name = "catppuccin" },
    { name = "tokyonight" },
    { name = "kanagawa" },
    { name = "nightfox" },
    { name = "rose-pine" },
  }

  -- Format items for the selector
  local items = {}
  for _, scheme in ipairs(colorschemes) do
    local indicator = scheme.name == current_scheme and " ● " or "   "
    table.insert(items, indicator .. scheme.name)
  end

  vim.ui.select(
    items,
    { prompt = "Select Colorscheme (● = current)" },
    function(selected)
      if selected then
        -- Extract just the colorscheme name from the selection
        local selected_name = selected:match("^%s*●?%s*(.+)$")
        
        -- Apply the selected colorscheme
        if selected_name == "cobalt2" then
          require("colorbuddy").colorscheme("cobalt2")
        else
          vim.cmd.colorscheme(selected_name)
        end
        
        -- Show a notification with the selected theme
        vim.notify("Colorscheme changed to " .. selected_name, vim.log.levels.INFO)
      end
    end
  )
end, { desc = "Select Colorscheme" })
