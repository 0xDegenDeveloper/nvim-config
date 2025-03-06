return {
  -- Your colorschemes with configurations
  {
    "lalitmee/cobalt2.nvim",
    lazy = true,
    dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
    init = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
    },
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "storm", -- storm, moon, night, day
    },
  },

  -- Add more colorschemes here
  { "rebelot/kanagawa.nvim", priority = 1000 },
  { "EdenEast/nightfox.nvim", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },

  -- Set the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox", -- Change this to your preferred default
    },
  },
}

