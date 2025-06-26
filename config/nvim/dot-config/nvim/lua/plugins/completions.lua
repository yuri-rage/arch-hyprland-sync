return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "normal",
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
}
