return {
	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local builtin = require("telescope.builtin")

			-- Helper: jump to buffer in any tab; returns true if found
			local function goto_existing_buffer(bufnr)
				local target_buf = bufnr or action_state.get_selected_entry().bufnr
				-- scan every tab and window for this buffer
				for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
					for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
						if vim.api.nvim_win_get_buf(win) == target_buf then
							-- switch to the tab and window
							vim.api.nvim_set_current_tabpage(tab)
							vim.api.nvim_set_current_win(win)
							return true
						end
					end
				end
				return false
			end

			-- buffers picker that prefers existing tabs/windows
			local function buffers_smart()
				builtin.buffers({
					attach_mappings = function(_, map)
						-- default <CR> → smart jump
						actions.select_default:replace(function(buf)
							if not goto_existing_buffer() then
								-- buffer not visible anywhere; open normally
								actions.select_default(buf)
							end
						end)
						-- keep the other split mappings if you like
						map("i", "<C-x>", actions.file_split)
						map("i", "<C-v>", actions.file_vsplit)
						return true
					end,
				})
			end

			-- keymaps
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
			vim.keymap.set("n", "<C-r>", buffers_smart, {})
		end,
	},

	-- Enhanced search and jump
	{
		"folke/flash.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<Leader><Leader>w",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = {
							forward = true,
							wrap = false,
							multi_window = false,
							jump_labels = true,
							enable = true,
						},
					})
				end,
				desc = "Flash",
			},
			{
				"<Leader><Leader>b",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
				end,
				desc = "Flash",
			},
			{
				"<Leader>s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},

	-- Motion with jump labels
	{
		"easymotion/vim-easymotion",
	},

	-- Syntax highlighting and text objects
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 1,
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"python",
				"typescript",
				"tsx",
				"rust",
				"html",
				"xml",
				"yaml",
				"markdown",
				"markdown_inline",
				"diff",
				"css",
				"latex",
				"norg",
				"scss",
				"svelte",
				"typst",
				"vue",
				"regex",
			},
			auto_install = true,
			highlight = { enable = true },
		},
	},

	-- File explorer
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			explorer = {},
		},
		keys = {
			{
				"<Leader>e",
				function()
					require("snacks").explorer({ focus = "input" })
				end,
				desc = "File Explorer",
			},
		},
	},

	-- Window layout manager
	{
		"delphinus/dwm.nvim",
		config = function()
			local dwm = require("dwm")
			vim.keymap.set("n", "<C-n>", dwm.new)
			vim.keymap.set("n", "<C-Space>", dwm.focus)
			vim.keymap.set("n", "<C-l>", dwm.grow)
			vim.keymap.set("n", "<C-h>", dwm.shrink)
			vim.keymap.set("n", "<C-S-K>", dwm.rotateLeft)
			vim.keymap.set("n", "<C-S-J>", dwm.rotate)

			-- Disable for certain buftype
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				callback = function()
					if vim.opt.buftype:get() == "nofile" then
						vim.b.dwm_disabled = true
					end
				end,
			})

			-- Disable for terminals
			vim.api.nvim_create_autocmd({ "TermOpen" }, {
				callback = function()
					vim.b.dwm_disabled = true
				end,
			})
		end,
	},
}
