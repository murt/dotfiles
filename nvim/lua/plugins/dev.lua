return {
	-- Package manager for LSP, formatters, linters
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ruff" },
		},
	},
	{
		"zapling/mason-conform.nvim",
		opts = {
			ensure_installed = { "stylua" },
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		opts = {
			ensure_installed = { "selene" },
		},
	},

	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function()
			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						telemetry = false,
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			-- Python
			vim.lsp.config("ruff", {
				settings = {
					logLevel = "debug",
				},
			})
		end,
	},

	-- LSP progress indicator
	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- LSP diagnostics display
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		keys = {
			{
				"<Leader>l",
				function()
					require("lsp_lines").toggle()
				end,
				mode = "n",
				desc = "Toggle LSP Lines",
			},
		},
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		keys = {
			{
				"FF",
				function()
					require("conform").format({ async = true })
				end,
				mode = "n",
				desc = "Format buffer with Conform",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = {
					"ruff_format",
					"ruff_organize_imports",
				},
			},
		},
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "selene" },
				python = { "ruff" },
			}
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
				callback = function()
					require("lint").try_lint(nil, { ignore_errors = true })
				end,
			})
			vim.api.nvim_create_user_command("LintInfo", function()
				local filetype = vim.bo.filetype
				local linters = require("lint").linters_by_ft[filetype]

				if linters then
					print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
				else
					print("No linters configured for filetype: " .. filetype)
				end
			end, {})
		end,
	},

	-- Completion
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "none",
				["<Tab>"] = { "select_next", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-Space>"] = { "show_signature", "show_documentation", "fallback" },
			},
		},
	},
}
