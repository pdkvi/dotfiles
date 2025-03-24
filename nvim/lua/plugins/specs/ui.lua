return
{
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("dressing").setup({
            input =
            {
                relative = "cursor",
                prefer_width = 0
            },

            select =
            {
                backend = { "builtin" },
                get_config = function(opts)
                    if opts.kind == "codeaction" then
                        return { builtin = { relative = "cursor" } }
                    end
                end,
                builtin =
                {
                    relative = "editor",
                    min_width = { 0, 0.1 },
                    min_height = { 0, 0.0 },
                    override = function(conf)
                        conf.width =  conf.width + 2
                        return conf
                    end
                }
            }
        })
    end
}
