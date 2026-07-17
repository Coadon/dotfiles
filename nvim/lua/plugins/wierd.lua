return {
    {
        "gruvw/strudel.nvim",
        lazy = true,
        build = "npm install",
        keys = {
            { "<leader>sl", ":StrudelLaunch<CR>", { desc = "Launch Strudel" } },
            { "<leader>sq", ":StrudelQuit<CR>", { desc = "Quit Strudel" } },
            { "<leader>st", ":StrudelToggle<CR>", { desc = "Strudel Toggle Play/Stop" } },
            { "<leader>su", ":StrudelUpdate<CR>", { desc = "Strudel Update" } },
            { "<leader>ss", ":StrudelStop<CR>", { desc = "Strudel Stop Playback" } },
            { "<leader>sb", ":StrudelSetBuffer<CR>", { desc = "Strudel set current buffer" } },
            { "<leader>sx", ":StrudelExecute<CR>", { desc = "Strudel set current buffer and update" } },
        },
        config = function()
            require("strudel").setup()
        end
    }
}
