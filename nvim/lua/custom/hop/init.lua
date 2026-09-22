-- HopWordCurrentLine
local hop_words = require("custom.hop.words")
local hop_labels = require("custom.hop.labels")
local M = {}
local ns_id
local DIM_PRIORITY = 65533
local HINT_PRIORITY = 65534

local function set_highlights()
	-- 与 hop.nvim 使用相同的高亮组和默认色，方便 colorscheme 自定义。
	vim.api.nvim_set_hl(0, "HopNextKey", {
		fg = "#ff007c",
		bold = true,
		ctermfg = 198,
		cterm = { bold = true },
		default = true,
	})
	vim.api.nvim_set_hl(0, "HopUnmatched", {
		fg = "#666666",
		sp = "#666666",
		ctermfg = 242,
		default = true,
	})
end

local function hop_word_current_line()
	local line = vim.api.nvim_get_current_line()
	local line_number = vim.api.nvim_win_get_cursor(0)[1]
	local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
	local words = hop_words.find(line)

	if #words == 0 then
		return
	end

	-- 按距离光标远近排序，近的单词分配单字母标签
	table.sort(words, function(a, b)
		return math.abs(a.col - cursor_col) < math.abs(b.col - cursor_col)
	end)

	-- 标签字母（按手指舒适度排序）
	local chars = "asdfghjklqweruiopzxcvbnm"
	local label_map = {}
	local labels, label_width = hop_labels.generate(chars, #words)

	-- 匹配期间弱化当前行，让跳转标签成为唯一的视觉焦点。
	vim.api.nvim_buf_set_extmark(0, ns_id, line_number - 1, 0, {
		end_col = #line,
		hl_group = "HopUnmatched",
		hl_eol = true,
		priority = DIM_PRIORITY,
	})

	for i, word in ipairs(words) do
		local label = labels[i]
		label_map[label] = word
		local virt_text = { { label:sub(1, 1), "HopNextKey" } }
		if #label > 1 then
			table.insert(virt_text, { label:sub(2), "HopUnmatched" })
		end

		vim.api.nvim_buf_set_extmark(0, ns_id, line_number - 1, word.col, {
			virt_text = virt_text,
			virt_text_pos = "overlay",
			hl_mode = "combine",
			priority = HINT_PRIORITY,
		})
	end

	vim.cmd("redraw")

	-- 等待用户输入
	local input = {}
	for _ = 1, label_width do
		local ok, char = pcall(vim.fn.getcharstr)
		if not ok then
			vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
			return
		end
		table.insert(input, char)
	end

	local target = label_map[table.concat(input)]

	-- 清理标签
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

	if target then
		vim.api.nvim_win_set_cursor(0, { line_number, target.col })
	end
end

function M.setup()
	ns_id = vim.api.nvim_create_namespace("hop_line")
	set_highlights()

	local group = vim.api.nvim_create_augroup("CustomHopHighlights", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = group,
		callback = set_highlights,
	})
end

M.word_current_line = hop_word_current_line

return M
