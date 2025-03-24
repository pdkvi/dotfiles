return
{
    "folke/edgy.nvim",
    config = function()
        -- vim.opt.laststatus = 3
        -- vim.opt.splitkeep = "screen"

        require("edgy").setup({
            left =
            {
                { ft = "NvimTree", wo = { winbar = false } }
            },

            options = { left = { size = 45 } },
            animate = { enabled = false }
        })
    end
}
