return {
    "danymat/neogen",
    keys = { { "<leader>g", ":lua require('neogen').generate()<CR>", desc = "Comment Generator" } },
    opts = { snippet_engine = "luasnip" }
}
