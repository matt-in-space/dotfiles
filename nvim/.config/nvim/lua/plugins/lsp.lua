return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "elixirls", "emmet_language_server", "lua_ls", "rust_analyzer", "ts_ls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configure servers using the new vim.lsp.config API
            vim.lsp.config('elixirls', {
                capabilities = capabilities,
                cmd = { vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh" },
            })

            vim.lsp.config('emmet_language_server', {
                capabilities = capabilities,
                filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "heex", "svelte" },
            })

            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            vim.lsp.config('rust_analyzer', {
                capabilities = capabilities,
            })

            vim.lsp.config('ts_ls', {
                capabilities = capabilities,
            })

            -- Enable all configured servers
            vim.lsp.enable({ 'elixirls', 'emmet_language_server', 'lua_ls', 'rust_analyzer', 'ts_ls' })
        end,
    },
}
