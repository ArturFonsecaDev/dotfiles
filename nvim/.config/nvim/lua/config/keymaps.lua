for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("bufferline").go_to(i, true)
	end, { desc = "Go to buffer " .. i })
end

for i = 1, 9 do
	vim.keymap.set("n", "<leader>c" .. i, function()
		local buf = require("bufferline").get_elements().elements[i]
		if buf then
			vim.api.nvim_buf_delete(buf.id, { force = false })
		end
	end)
end
