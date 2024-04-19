return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
            rocks = { "magick" },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        config = function()
            require('image').setup({
                backend = "kitty",
                -- max_width = 100,
                -- max_height = 12,
                -- max_height_window_percentage = math.huge,
                -- max_width_window_percentage = math.huge,
                -- window_overlap_clear_enabled = true,
            })
        end
    }
}
