return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "prettierd",
        "prettier",
        "black",
        "isort",
        -- Add other formatters you need
      })
    end,
  },
} 