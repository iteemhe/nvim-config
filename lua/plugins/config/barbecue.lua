local config = {
    -- create_autocmd = false, -- prevent barbecue from updating itself automatically
    -- attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
    -- show_modified = true,
    exclude_filetype = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "qf",
    },
}

require("barbecue").setup(config)

--[[
vim.api.nvim_create_autocmd({
	"WinScrolled",
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include these if you have set `show_modified` to `true`
	"BufWritePost",
	"TextChanged",
	"TextChangedI",
}, {
	group = vim.api.nvim_create_augroup("barbecue", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
]]
