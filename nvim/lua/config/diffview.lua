local actions = require("diffview.actions")

require("diffview").setup({
	-- 基础选项
	diff_binaries = false, -- 是否显示二进制文件 diff
	enhanced_diff_hl = false, -- 增强差异高亮（需自定义 highlight group）
	git_cmd = { "git" }, -- git 可执行文件及默认参数
	use_icons = true, -- 使用文件图标（需 nvim-web-devicons）
	show_help_hints = true, -- 显示帮助提示
	watch_index = true, -- 监听 git index 变化并自动更新

	-- 图标配置
	icons = {
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
		done = "✓",
	},

	-- 视图布局配置
	view = {
		default = {
			layout = "diff2_horizontal", -- 默认双栏水平布局
			disable_diagnostics = false,
			winbar_info = false,
		},
		merge_tool = {
			layout = "diff3_mixed", -- 合并冲突默认三栏水平布局
			disable_diagnostics = true,
			winbar_info = true,
		},
		file_history = {
			layout = "diff2_horizontal",
			disable_diagnostics = false,
			winbar_info = false,
		},
	},

	-- 文件面板配置
	file_panel = {
		listing_style = "tree", -- 'list' 或 'tree'
		tree_options = {
			flatten_dirs = true, -- 扁平化只有单一子目录的文件夹
			folder_statuses = "only_folded", -- 'never' | 'only_folded' | 'always'
		},
		win_config = {
			position = "left",
			width = 35,
			win_opts = {},
		},
	},

	-- 文件历史面板配置
	file_history_panel = {
		log_options = {
			git = {
				single_file = { diff_merges = "combined" },
				multi_file = { diff_merges = "first-parent" },
			},
		},
		win_config = {
			position = "bottom",
			height = 16,
		},
	},

	-- 命令默认参数
	default_args = {
		DiffviewOpen = {},
		DiffviewFileHistory = {},
	},

	-- 快捷键配置（见下文详解）
	keymaps = {
		disable_defaults = false,
		view = {
			{ "n", "<tab>", actions.select_next_entry, { desc = "下一个文件" } },
			{ "n", "<s-tab>", actions.select_prev_entry, { desc = "上一个文件" } },
			{ "n", "gf", actions.goto_file_edit, { desc = "在原标签页打开文件" } },
			{ "n", "<leader>e", actions.focus_files, { desc = "聚焦文件面板" } },
			{ "n", "<leader>b", actions.toggle_files, { desc = "切换文件面板" } },
			{ "n", "g<C-x>", actions.cycle_layout, { desc = "切换布局" } },
		},
		file_panel = {
			{ "n", "j", actions.next_entry, { desc = "下一个条目" } },
			{ "n", "k", actions.prev_entry, { desc = "上一个条目" } },
			{ "n", "<cr>", actions.select_entry, { desc = "打开选中文件" } },
			{ "n", "-", actions.toggle_stage_entry, { desc = "暂存/取消暂存" } },
			{ "n", "S", actions.stage_all, { desc = "全部暂存" } },
			{ "n", "U", actions.unstage_all, { desc = "全部取消暂存" } },
			{ "n", "X", actions.restore_entry, { desc = "恢复文件" } },
			{ "n", "L", actions.open_commit_log, { desc = "打开提交日志" } },
		},
	},
})
