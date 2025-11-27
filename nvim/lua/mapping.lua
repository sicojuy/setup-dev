local map = require("common").map
local nnoremap = require("common").nnoremap
local inoremap = require("common").inoremap
local vnoremap = require("common").vnoremap
local cnoremap = require("common").cnoremap

-- copy
vnoremap("<leader>y", '"+y')
nnoremap("<leader>yy", '"+yy')
nnoremap("<leader>p", '"+p')

-- moving
inoremap("<c-a>", "<Home>")
inoremap("<c-e>", "<End>")
inoremap("<c-f>", "<Right>")
inoremap("<c-b>", "<Left>")
cnoremap("<c-a>", "<Home>")
cnoremap("<c-e>", "<End>")
cnoremap("<c-f>", "<Right>")
cnoremap("<c-b>", "<Left>")
cnoremap("<Esc>f", "<S-Right>")
cnoremap("<Esc>b", "<S-Left>")

-- window
nnoremap("<c-h>", "<c-w>h")
nnoremap("<c-j>", "<c-w>j")
nnoremap("<c-k>", "<c-w>k")
nnoremap("<c-l>", "<c-w>l")
nnoremap("<c-c>", "<c-w>c")

nnoremap("<c-a>", "<cmd>WindowsMaximize<cr>")

-- tab
nnoremap("<Tab>", "gt")
nnoremap("<leader>1", "1gt")
nnoremap("<leader>2", "2gt")
nnoremap("<leader>3", "3gt")
nnoremap("<leader>4", "4gt")
nnoremap("<leader>5", "5gt")
nnoremap("<leader>6", "6gt")
nnoremap("<leader>7", "7gt")
nnoremap("<leader>8", "8gt")
nnoremap("<leader>9", "9gt")
nnoremap("<leader>0", "<cmd>tablast<cr>")
nnoremap("<leader>tt", "<cmd>tabnew<cr>")
nnoremap("<leader>th", "<cmd>tabmove -1<cr>")
nnoremap("<leader>tl", "<cmd>tabmove +1<cr>")

-- hop.nvim
nnoremap("<leader><leader>f", "<cmd>HopChar1<cr>")
nnoremap("<leader><leader>w", "<cmd>HopWord<cr>")
nnoremap("<leader><leader>l", "<cmd>HopWordCurrentLine<cr>")

-- align
vnoremap("ga", "<Plug>(EasyAlign)")
nnoremap("ga", "<Plug>(EasyAlign)")

-- markdown preview
nnoremap("<leader>m", "<cmd>MarkdownPreview<cr>")

-- nvim tree
nnoremap("<leader>n", "<cmd>NvimTreeToggle<cr>")

-- telescope
local builtin = require("telescope.builtin")
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fs", function()
	builtin.grep_string({ word_match = "-w", additional_args = { "--case-sensitive" } })
end)
-- find function implementation
nnoremap("<leader>fi", function()
	local pattern = "^func\\s+(?:\\([\\s\\S]*?\\)\\s+)?" .. vim.fn.expand("<cword>") .. "\\s*\\("
	builtin.grep_string({ search = pattern, use_regex = true, additional_args = { "-g", "*.go", "-g", "!*_test.go" } })
end)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.search_history)
nnoremap("<leader>fo", builtin.oldfiles)
nnoremap("<leader>fr", builtin.resume)
