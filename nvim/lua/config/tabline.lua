local fn = vim.fn

local function tabline()
	local s = ""
	for index = 1, fn.tabpagenr("$") do
		local winnr = fn.tabpagewinnr(index, "$")
		if winnr > 1 then
			winnr = 2
		else
			winnr = 1
		end
		local buflist = fn.tabpagebuflist(index)
		local bufnr = buflist[winnr]
		local bufname = fn.bufname(bufnr)

		s = s .. "%" .. index .. "T"
		if index == fn.tabpagenr() then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end

		-- buf index
		s = s .. " " .. index .. ":"

		-- buf name
		if bufname ~= "" then
			s = s .. "[" .. fn.fnamemodify(bufname, ":t") .. "] "
		else
			s = s .. "[None] "
		end
	end

	s = s .. "%#TabLineFill#"
	return s
end

function _G.nvim_tabline()
	return tabline()
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.nvim_tabline()"

vim.g.loaded_nvim_tabline = 1
