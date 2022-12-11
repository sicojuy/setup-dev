-- remove spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("editor_options", { clear = true }),
    pattern = { "*" },
    callback = function()
        local exclude_filetypes = { "markdown", "vimwiki" }
        local ft = vim.bo.filetype
        for _, ef in ipairs(exclude_filetypes) do
            if ft == ef then
                return
            end
        end
        local view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.cmd([[silent! 0;/^\%(\n*.\)\@!/,$d]])
        vim.fn.winrestview(view)
    end,
})

-- highlight lag when yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = editor,
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank({ timeout = 500 })
    end,
})

-- tabwith
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = editor,
    pattern = {
        "css",
        "html",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "vim",
        "vue",
    },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = editor,
    pattern = {
        "go",
    },
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
    end,
})

-- quickfix
local qf = vim.api.nvim_create_augroup("qf_options", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter" }, {
    group = qf,
    pattern = { "*" },
    callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
            vim.cmd("q")
        end
    end,
})

-- lua format
local format = vim.api.nvim_create_augroup("formatter_options", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = format,
    pattern = { "*.lua" },
    callback = function(opts)
        local view = vim.fn.winsaveview()
        if vim.fn.executable("~/.stylua.toml") then
            vim.fn.execute(":silent !stylua " .. opts.file .. " --config-path ~/.stylua.toml")
        else
            vim.fn.execute(":silent !stylua " .. opts.file)
        end
        vim.api.nvim_exec("edit!", true)
        vim.fn.winrestview(view)
    end,
})

-- shell format
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = format,
    pattern = { "*.sh" },
    callback = function(opts)
        local view = vim.fn.winsaveview()
        vim.fn.execute(":silent !shfmt -l -w " .. opts.file)
        vim.api.nvim_exec("edit!", true)
        vim.fn.winrestview(view)
    end,
})
