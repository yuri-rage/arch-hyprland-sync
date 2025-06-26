return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            TODO = { icon = " ", color = "todo" },
            todo = { icon = " ", color = "todo" },
            Todo = { icon = " ", color = "todo" },
        },
        colors = {
            todo = { '#fd9353' }
        },
    },
}
