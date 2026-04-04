return {
	-- Dependency library
	{
		"nvim-lua/plenary.nvim",
	},

	-- Keymap helper (disabled)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		enabled = false,
	},

	-- Buffer scope management (disabled)
	{
		"tiagovla/scope.nvim",
		enabled = false,
		config = true,
	},

	-- Window tabs (disabled)
	{
		"zefei/vim-wintabs",
		enabled = false,
		config = function()
			vim.g.wintabs_display = "none"
			vim.keymap.set("n", "<Leader>]", ":WintabsNext<CR>")
			vim.keymap.set("n", "<Leader>[", ":WintabsPrevious<CR>")
		end,
	},

	-- File operations
	{
		"tpope/vim-eunuch",
	},
}
