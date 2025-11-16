return {
	-- AI assistant (disabled)
	{
		"olimorris/codecompanion.nvim",
		enabled = false,
		opts = {
			strategies = {
				chat = { adapter = "ollama" },
				inline = { adapter = "ollama" },
			},
			opts = {
				log_level = "DEBUG",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Markdown preview for AI chats
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		priority = 47,
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},

	-- Diff viewer for AI-assisted changes
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Disabled by default
				source = diff.gen_source.none(),
			})
		end,
	},

	-- Claude Code integration
	{
		"coder/claudecode.nvim",
		enabled = true,
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{
				"<Leader>c",
				"<cmd>ClaudeCode<CR>",
				mode = "n",
				desc = "Toggle ClaudeCode",
			},
		},
	},

	-- Lua REPL
	{
		"mghaight/replua.nvim",
	},

	-- Lua playground (disabled by default)
	{
		"rafcamlet/nvim-luapad",
		enabled = false,
	},
}
