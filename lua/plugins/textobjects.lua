-- Enhanced text objects for faster, more precise editing.
--
-- mini.ai — smarter i/a targets (works with c/d/y/v operators):
--   af / if  →  around / inside function body
--   ac / ic  →  around / inside class
--   aa / ia  →  around / inside argument (including the comma)
--   a" / i"  →  enhanced quote objects (handles nested quotes correctly)
--
-- mini.surround — add, change, or delete surrounding delimiters:
--   sa{motion}{char}  →  surround motion with char   e.g. saiw"  wraps word in quotes
--   sd{char}          →  delete surrounding char      e.g. sd"    removes surrounding quotes
--   sr{old}{new}      →  replace surrounding           e.g. sr'"   swaps ' for "

return {
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {
            mappings = {
                add            = "sa",  -- sa{motion}{char}
                delete         = "sd",  -- sd{char}
                replace        = "sr",  -- sr{old}{new}
                find           = "sf",  -- find next surrounding
                find_left      = "sF",  -- find previous surrounding
                highlight      = "sh",  -- highlight surrounding
                update_n_lines = "sn",  -- update search radius
            },
        },
    },
}
