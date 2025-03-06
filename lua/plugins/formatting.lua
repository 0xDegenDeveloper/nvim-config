return {
    -- Configure LazyVim's built-in formatting
    {
        "LazyVim/LazyVim",
        opts = {
            format = {
                enabled = true,
                format_on_save = {
                    enabled = true,
                    allow_filetypes = {"cairo", "typescript", "javascript"}, -- Only enable for specific filetypes
                    ignore_filetypes = {} -- disable for no filetypes
                },
                timeout_ms = 1000,
                -- Use Conform for formatting instead of LSP
                filter = function(client)
                    return
                        client.name ~= "tsserver" and client.name ~= "jsonls" and
                            client.name ~= "lua_ls" and client.name ~=
                            "cairo_ls"
                end
            }
        }
    }
}
