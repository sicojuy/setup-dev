require("gitsigns").setup({
    signs = {
        add = { hl = "GitGutterAdd", text = "+" },
        change = { hl = "GitGutterChange", text = "~" },
        delete = { hl = "GitGutterDelete", text = "_" },
        topdelete = { hl = "GitGutterDelete", text = "‾" },
        changedelete = { hl = "GitGutterChange", text = "~" },
    },
    current_line_blame = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "<leader>hn", function()
            if vim.wo.diff then
                return "<leader>hn"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "<leader>hp", function()
            if vim.wo.diff then
                return "<leader>hp"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hP", gs.preview_hunk)
        map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
        end)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function()
            gs.diffthis("~")
        end)
    end,
})
