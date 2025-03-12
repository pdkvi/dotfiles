return
{
    "Civitasv/cmake-tools.nvim",
    dependencies = { {"akinsho/toggleterm.nvim", opts = { direction = "horizontal" }} },

    config = function()
        local const = vim.tbl_extend("force", require("cmake-tools.const"),
        {
            cmake_regenerate_on_save = false,
            cmake_generate_options =
            {
                "-GNinja",

                "-DCMAKE_C_COMPILER=clang",
                "-DCMAKE_CXX_COMPILER=clang++",

                "-DCMAKE_COLOR_DIAGNOSTICS=ON",

                "-DCMAKE_EXPORT_COMPILE_COMMANDS=1"
            },
            cmake_dap_configuration = { type = "lldb" },
            cmake_executor = {
                name = "toggleterm",
                default_opts =
                {
                    toggleterm =
                    {
                        direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                        close_on_exit = false, -- whether close the terminal when exit
                        auto_scroll = true, -- whether auto scroll to the bottom
                        singleton = true, -- single instance, autocloses the opened one, if present
                    },
                }
            },

            cmake_notifications =
            {
                runner = { enabled = false },
                executor = { enabled = false }
            },

            cmake_virtual_text_support = false
        })

        local cmake = require("cmake-tools")
        cmake.setup(const)

        vim.api.nvim_create_autocmd("DirChanged",
        {
            callback = function()
                local cwd = vim.uv.cwd()
                if vim.fn.filereadable(cwd .. "/CMakeLists.txt") ~= 1 then
                    return
                end

                local config = cmake.get_config()

                config.cwd = vim.fn.resolve(cwd)
                config:update_build_dir(const.cmake_build_directory, const.cmake_build_directory)
                cmake.register_scratch_buffer(config.executor.name, config.runner.name)

                vim.notify("Changed project root directory to " .. config.cwd, nil, {
                    title = "CMake"
                })
            end
        })

        vim.keymap.set("n", "<F3>", function() cmake.generate({}) end)

        local function build_target(target)
            local co = coroutine.create(function()
                local co = coroutine.running()

                if cmake.get_config():has_build_directory() == false then
                    cmake.generate({}, function(result)
                        if result:is_ok() == false then return end
                        coroutine.resume(co)
                    end)
                    coroutine.yield()
                end
                vim.defer_fn(function() cmake.build({ target = target }) end, 1)
            end)
            coroutine.resume(co)
        end

        vim.keymap.set("n", "<F7>", function() build_target("all") end)
        vim.keymap.set("n", "<F19>", function()
            cmake.select_build_target(false, function(result)
                if result:is_ok() == false then return end
                build_target(cmake.get_build_target())
            end)
        end)

        vim.keymap.set("n", "<F29>", function()
            local co = coroutine.create(function()
                local co = coroutine.running()

                if cmake.get_build_target() == nil then
                    cmake.select_build_target(true, function() coroutine.resume(co) end)
                    coroutine.yield()
                end

                cmake.build({ target = cmake.get_build_target() }, function(result)
                    if result:is_ok() == false then return end
                    coroutine.resume(co)
                end)
                coroutine.yield()

                vim.system({
                    "alacritty", "-o", "cursor.style.blinking=\"always\"",
                    "-e", "bash", "-c",
                    cmake.get_build_target_path() .. " ; " ..
                    "printf '\\nPress any key to continue...'" .. " && " ..
                    "read -sr -n 1"
                })
            end)

            coroutine.resume(co)
        end)
    end
}
