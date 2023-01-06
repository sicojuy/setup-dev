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

-- quickfix
nnoremap("<leader>cc", "<cmd>cclose<cr>")
nnoremap("<leader>,", "<cmd>cprev<cr>")
nnoremap("<leader>.", "<cmd>cnext<cr>")

-- align
vnoremap("ga", "<Plug>(EasyAlign)")
nnoremap("ga", "<Plug>(EasyAlign)")

-- markdown preview
nnoremap("<leader>m", "<cmd>MarkdownPreview<cr>")

-- nvim tree
nnoremap("<leader>n", "<cmd>NvimTreeToggle<cr>")

-- symbols outline
nnoremap("<leader>s", "<cmd>SymbolsOutline<cr>")

-- telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fs", "<cmd>Telescope grep_string<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fS", "<cmd>Telescope lsp_document_symbols<cr>")
nnoremap("<leader>fh", "<cmd>Telescope search_history<cr>")
nnoremap("<leader>fo", "<cmd>Telescope oldfiles<cr>")
nnoremap("<leader>fr", "<cmd>Telescope resume<cr>")

-- go debug
nnoremap("<leader>gg", "<cmd>GoDebugNext<cr>")
nnoremap("<leader>gs", "<cmd>GoDebugStep<cr>")
nnoremap("<leader>go", "<cmd>GoDebugStepOut<cr>")
nnoremap("<leader>gb", "<cmd>GoDebugBreakpoint<cr>")
nnoremap("<leader>gc", "<cmd>GoDebugContinue<cr>")
