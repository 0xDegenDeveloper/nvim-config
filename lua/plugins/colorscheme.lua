return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm", -- storm, moon, night, day
    },
  },
  { "rebelot/kanagawa.nvim", priority = 1000, opts = { style = "lotus" } },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000, -- Make sure it loads first
    config = function()
      require("nightfox").setup({
        -- You can customize nightfox here
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic",
          },
        },
      })
    end,
  }, -- { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  -- Set the default colorscheme
  { "LazyVim/LazyVim", opts = { colorscheme = "nightfox" } },
}
