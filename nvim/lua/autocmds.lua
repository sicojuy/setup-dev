local formatter = require('formatter')

-- remove spaces
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = vim.api.nvim_create_augroup('editor_options', { clear = true }),
    pattern = { '*' },
    callback = function()
        local exclude_filetypes = { 'markdown', 'vimwiki' }
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
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
    group = editor,
    pattern = { '*' },
    callback = function()
        vim.highlight.on_yank({ timeout = 500 })
    end,
})

-- filetypes
vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = editor,
    pattern = {
        'css',
        'html',
        'javascript',
        'typescript',
        'json',
        'yaml',
        'vim',
        'vue',
    },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
    end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = editor,
    pattern = {
        'go',
    },
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
    end,
})

-- quickfix
local qf = vim.api.nvim_create_augroup('qf_options', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
    group = qf,
    pattern = { '*' },
    callback = function()
        if vim.fn.winnr('$') == 1 and vim.bo.buftype == 'quickfix' then
            vim.cmd('q')
        end
    end,
})

-- lsp
local lsp = vim.api.nvim_create_augroup('lsp_options', { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    group = lsp,
    pattern = { '*' },
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, scope = 'cursor' })
    end,
})

-- formatter
local format = vim.api.nvim_create_augroup('formatter_options', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = format,
    pattern = { '*.lua' },
    callback = formatter.lua_format,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = format,
    pattern = { '*.sh' },
    callback = formatter.shell_format,
})

-- nvim-go
local nvim_go = vim.api.nvim_create_augroup('nvim_go', { clear = true })
vim.api.nvim_create_autocmd({ 'User' }, {
    group = nvim_go,
    pattern = { 'NvimGoLintPopupPost' },
    callback = function()
        vim.cmd('wincmd p')
    end,
})
