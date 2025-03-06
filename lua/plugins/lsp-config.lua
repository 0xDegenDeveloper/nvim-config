return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    }, {
        "williamboman/mason-lspconfig.nvim",
        opts = {ensure_installed = {"cairo_ls", "rust_analyzer"}}
    }, {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                cairo_ls = {
                    cmd = {"scarb", "cairo-language-server", "/C", "--node-ipc"}
                }
            }
        }
    }
}
