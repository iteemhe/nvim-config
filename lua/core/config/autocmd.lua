local api = vim.api
local opt = vim.opt
local fn = vim.fn

api.nvim_create_autocmd({ "FileType" }, {
	desc = "Remove ':' from indent keys.",
	pattern = { "c", "cpp", "h", "python" },
	callback = function()
		opt.indentkeys = opt.indentkeys - ":"
		opt.cinkeys = opt.cinkeys - ":"
	end,
})

api.nvim_create_autocmd({ "FileType" }, {
	desc = "Do not auto complete single-line comment.",
	pattern = { "c", "cpp", "h" },
	callback = function()
		opt.comments = opt.comments - "://" + "f://"
		-- opt.comments.append("f://")
	end,
})

api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Hightlight Yanked Text",
	callback = function()
		vim.highlight.on_yank({
			timeout = 150,
		})
	end,
})
