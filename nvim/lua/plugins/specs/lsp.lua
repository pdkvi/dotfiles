return
{
    "neovim/nvim-lspconfig",
    dependencies =
    {
        {
            "folke/lazydev.nvim", ft = "lua",
            dependencies = { "Bilal2453/luvit-meta", lazy = true },
            opts =
            {
                library =
                {
                    { path = "luvit-meta/library", words = { "vim%.uv" }}
                }
            }
        },
        -- "Issafalcon/lsp-overloads.nvim"
    },

    config = function()
        local lspconfig = require("lspconfig")

        vim.keymap.set("n", "<C-j>", "<C-e>")
        vim.keymap.set("i", "<C-j>", "")

        vim.keymap.set("n", "<C-k>", "<C-y>")
        vim.keymap.set("i", "<C-k>", "")

        vim.keymap.set("n", "<A-CR>", vim.lsp.buf.code_action)

        local float_opts = { border = "rounded", max_width = 100 }

        -- <C-i> = \u{f7fe}
        vim.keymap.set("n", "<S-i>", function() vim.lsp.buf.hover(float_opts) end)

        vim.keymap.set("n", "K", function()
            local float_bufnr, win_id = vim.diagnostic.open_float()
            if float_bufnr == nil and win_id == nil then
                vim.lsp.buf.hover(float_opts)
            end
        end)

        local signs =
        {
            [vim.diagnostic.severity.ERROR] = '▓',
            [vim.diagnostic.severity.WARN]  = '▓',
            [vim.diagnostic.severity.HINT]  = '▓',
            [vim.diagnostic.severity.INFO]  = '▓',
        }

        vim.diagnostic.config({
            virtual_text = { spacing = 0 },
            signs = { text = signs },
            float = float_opts
        })

        for type, icon in pairs(signs) do
            local hl = "LspDiagnosticsSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local common_capabilities = vim.lsp.protocol.make_client_capabilities()
        common_capabilities.textDocument.foldingRange =
        {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        ---@param client vim.lsp.Client
        ---@param bufnr integer
        local common_on_attach = function(client, bufnr)
            if client.server_capabilities.definitionProvider then
                vim.opt.tagfunc = "v:lua.preview_tagfunc"
            end

            -- TODO: update winbar after lsp load
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
                require("nvim-navbuddy").attach(client, bufnr)

                local wins = vim.iter(vim.api.nvim_list_tabpages())
                    :map(function(tabpage)
                        return vim.api.nvim_tabpage_list_wins(tabpage)
                    end):flatten()

                wins:filter(function(win) return vim.api.nvim_win_get_buf(win) == bufnr end)

                wins:each(function(win)
                    vim.wo[win].winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"
                end)
            end

            vim.keymap.set({"i", "n"}, "<F2>", vim.lsp.buf.rename, { buffer = bufnr })
        end

        local servers =
        {
            lua_ls =
            {
                settings =
                {
                    Lua =
                    {
                        diagnostics =
                        {
                            disable =
                            {
                                "redefined-local", "redundant-return-value"
                            }
                        }
                    }
                }
            },

            clangd =
            {
                cmd =
                {
                    "clangd",
                    "--header-insertion=never",
                    "--function-arg-placeholders=0",
                    "--clang-tidy",
                    "-j=4",
                    "--malloc-trim",
                    "--background-index",
                    "--pch-storage=memory"
                },
                on_attach = function()
                    vim.keymap.set("n", "<F4>", "<cmd>ClangdSwitchSourceHeader<cr>")
                end
            },

            neocmake = {}
        }

        for server, config in pairs(servers) do
            config.capabilities = vim.tbl_extend("keep", config.capabilities or {}, common_capabilities)

            local config_on_attach = config.on_attach or function()end
            config.on_attach = function(client, bufnr)
                common_on_attach(client, bufnr)
                config_on_attach(client, bufnr)
            end

            lspconfig[server].setup(config)
        end
    end
}
