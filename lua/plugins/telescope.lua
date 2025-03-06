return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          -- Commented allows using Esc to switch to normal mode
          -- Allow using Esc in insert mode to switch to normal mode
          --["<esc>"] = "close",
          
          -- Add other insert mode mappings you want here
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
        n = {
          -- Add normal mode mappings you want here
          ["q"] = "close",
        },
      },
      -- Restore the familiar layout
      --layout_strategy = "horizontal",
      --layout_config = {
      --  horizontal = {
      --    prompt_position = "top",
      --    preview_width = 0.55,
      --    results_width = 0.8,
      --  },
      --  width = 0.87,
      --  height = 0.80,
      --  preview_cutoff = 120,
      --},
      sorting_strategy = "descending",
      winblend = 0,
      path_display = { "truncate" },
    },
    -- Add any extensions you use
    extensions = {
      -- Configure extensions here
    },
  },
  -- Add any keymaps specific to telescope
  keys = {
    -- You can add custom keymaps here if needed
  },
} 