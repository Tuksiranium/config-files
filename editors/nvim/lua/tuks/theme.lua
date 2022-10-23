-- Theme config

-- THEMEING

require("vscode").setup({
    italic_comments = true,
    transparent = true,
})

require("transparent").setup({
    enable = true,
    extra_groups = {
--       "SignColumn",
--        "GitSignsAdd", "GitSignsAddLn",
--        "GitSignsDelete", "GitSignsDeleteLn",
--        "GitSignsChange", "GitSignsChangeLn",
    },
    exclude = {},
})
