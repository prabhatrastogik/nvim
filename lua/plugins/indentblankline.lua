-- Vertical indent guide lines — draws a thin character at each indentation level.
-- Helps trace nested blocks (especially useful in Python where indentation is syntax).
return {
    "lukas-reineke/indent-blankline.nvim",
    main  = "ibl",
    opts  = {},
    event = { "BufReadPost", "BufNewFile" },
}
