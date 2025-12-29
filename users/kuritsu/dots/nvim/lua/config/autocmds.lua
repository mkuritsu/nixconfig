vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local bufnr = ev.buf
		local lang = ev.match
		if vim.treesitter.get_parser(bufnr, lang, { error = false }) then
			vim.treesitter.start()
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
