local M = {}

function M.find(line)
	local words = {}
	local search_from = 1

	while search_from <= #line do
		local start_index, finish_index = line:find("[%w_]+", search_from)
		if not start_index then
			break
		end

		table.insert(words, {
			text = line:sub(start_index, finish_index),
			col = start_index - 1,
		})
		search_from = finish_index + 1
	end

	return words
end

return M
