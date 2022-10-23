local ts_config = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.x86asm = {
    install_info = {
        url = "https://github.com/bearcove/tree-sitter-x86asm",
        branch = "main",
        files = { "src/parser.c" },
        requires_generate_from_grammar = true,
        generate_requires_npm = true,
    },
    filetype = "asm",
    maintainers = { "@bearcove" },
    experimental = true,
}

ts_config.setup {

    ensure_installed = {
        "c", "cpp", "c_sharp", "lua", "ocaml",
        "rust", "python", "go", "java",
        "javascript", "typescript", "vim",
        "html", "css", "php", "markdown",
        "json", "yaml", "toml", "make",
        "cmake", "comment",
        "x86asm",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = { "yaml" },
    }
}
