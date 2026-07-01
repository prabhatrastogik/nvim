-- Docstring / annotation generator.
-- Places the cursor inside the generated template so you can fill it in immediately.
-- Supports Python (Google / NumPy / reST style), Go, TypeScript, Lua, and more.
--
-- <leader>ng  generate a docstring for the function / class under the cursor

return {
    "danymat/neogen",
    keys = {
        { "<leader>ng", ":lua require('neogen').generate()<CR>", desc = "Generate Docstring" }
    },
    opts = { snippet_engine = "luasnip" }  -- uses LuaSnip to insert the template
}
