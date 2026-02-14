-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>,", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>.", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	--vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	--vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set("n", "<leader>wl", function()
	--	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>x", vim.lsp.buf.format, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- go
vim.lsp.config("gopls", {
	on_attach = on_attach,
	capabilities = capabilities,
	-- cmd = {
	-- 	"gopls",
	-- 	"-remote=unix;/tmp/gopls-shared.sock",
	-- },
	settings = {},
})
vim.lsp.enable("gopls")
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "go",
-- 	callback = function()
-- 		local is_gopls_running = vim.fn.system("pgrep -f 'gopls serve'") ~= ""
-- 		if not is_gopls_running then
-- 			vim.fn.system("rm -f /tmp/gopls-shared.sock")
-- 			io.popen('gopls serve -listen "unix;/tmp/gopls-shared.sock" -debug :0 >"/tmp/gopls.log" 2>&1 &')
-- 		end
-- 	end,
-- })

-- rust
vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {},
})
vim.lsp.enable("rust_analyzer")

-- python
vim.lsp.config("pyright", {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {},
})
vim.lsp.enable("pyright")

-- lsp signature
local lsp_signature = require("lsp_signature")
lsp_signature.setup({})

-- complete
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}, {
		{ name = "path" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	-- mapping = cmp.mapping.preset.cmdline(),
	mapping = {
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
	},
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	-- mapping = cmp.mapping.preset.cmdline(),
	mapping = {
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
	},
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
