vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- leader key
vim.g.mapleader = ";"

vim.opt.number = true -- show line number
vim.opt.relativenumber = false -- show relative number
vim.opt.history = 1000 -- history commond count
vim.opt.backup = false -- no backup
vim.opt.writebackup = false -- no writebackup
vim.opt.swapfile = false -- no swap
vim.opt.undofile = true -- use undo file
vim.opt.updatetime = 300 -- time (in ms) to write to swap file
vim.opt.whichwrap = "b,s,<,>,[,]" -- cursor is able to move from end of line to next line
vim.opt.backspace = { "indent", "eol", "start" } -- backspace behaviors
vim.opt.list = false -- show tabs
vim.opt.listchars = { tab = "┆ " } -- show tabs with listchars
vim.opt.cursorline = true -- show cursor line
vim.opt.ruler = true -- show ruler line
-- vim.opt.colorcolumn = { 120 } -- display a color column when line is longer than 120 chars
vim.opt.signcolumn = "yes" -- show sign column (column of the line number)
vim.opt.showmatch = true -- show bracket match
vim.opt.cmdheight = 2 -- height of :command line
vim.opt.wildmenu = true -- wildmenu, auto complete for commands
vim.opt.wildmode = { "longest", "full" }
vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor.
vim.opt.splitright = false -- split to right
vim.opt.splitbelow = true -- split to below
vim.opt.inccommand = "nosplit" -- live substitute preview
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.hidden = true -- when off a buffer is unloaded when it is abandoned.
vim.opt.shortmess:append("c")
vim.opt.formatoptions:append("m")
vim.opt.formatoptions:append("B")
vim.opt.mouse = "" -- disable mouse
vim.opt.title = true
vim.opt.titlestring = '%{expand("%:p:h")}'
-- vim.opt.titlestring = "%F"

-- search
vim.opt.ignorecase = false -- search ignore case
vim.opt.smartcase = true -- case sensitive if contain upppercase
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = false -- no incremental search

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = {
	"ucs-bom",
	"utf-8",
	"gbk",
	"gb18030",
	"big5",
	"euc-jp",
	"ecu-kr",
	"latin1",
}

-- tab
vim.opt.autoindent = true -- auto indent for new line
vim.opt.expandtab = true -- expand tab
vim.opt.cindent = true -- enables automatic C program indenting
vim.opt.tabstop = 4 -- tab stop
vim.opt.shiftwidth = 4 -- auto indent shift width

-- display
if not vim.fn.has("gui_running") then
	vim.opt.t_Co = 256
end

if vim.fn.has("termguicolors") then
	vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
	vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
	vim.opt.termguicolors = true
end

-- python provider
vim.g.python3_host_prog = "/usr/bin/python3"

-- Chrome provider
if vim.fn.has("macos") then
	vim.g.mkdp_path_to_chrome = "open -a Google\\ Chrome"
end
