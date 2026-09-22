local M = {}

function M.generate(chars, count)
	local capacity = #chars
	assert(capacity > 0, "label characters must not be empty")

	local width = 1
	local available_labels = capacity
	while count > available_labels do
		width = width + 1
		available_labels = available_labels * capacity
	end
	local labels = {}

	for index = 0, count - 1 do
		local value = index
		local label = {}
		for position = width, 1, -1 do
			local char_index = (value % capacity) + 1
			label[position] = chars:sub(char_index, char_index)
			value = math.floor(value / capacity)
		end
		table.insert(labels, table.concat(label))
	end

	return labels, width
end

return M
