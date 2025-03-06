return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({async = true, lsp_fallback = true})
            end,
            mode = {"n", "v"},
            desc = "Format Buffer"
        }
    },

    opts = {
        default_format_opts = {
            timeout_ms = 1000,
            async = true, -- not recommended to change
            quiet = true, -- not recommended to change
            lsp_format = "fallback" -- not recommended to change
        },
        -- Define formatters by filetype
        formatters_by_ft = {
            lua = {"stylua"},
            python = {"isort", "black"},
            javascript = {"prettierd", "prettier", stop_after_first = true},
            typescript = {"prettierd", "prettier", stop_after_first = true},
            cairo = {"scarb_fmt"} -- Use our custom formatter for Cairo
        },
        -- Custom formatters
        formatters = {
            scarb_fmt = {
                command = "scarb",
                args = {"fmt"},
                stdin = false, -- Don't use stdin
                cwd = function(ctx)
                    return vim.fn.fnamemodify(ctx.filename, ":h")
                end,
                require_cwd = false,
                exit_codes = {0, 1}
            }
        }
    }
}
